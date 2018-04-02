package com.ssb.mailCounsel;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssb.common.FileManager;
import com.ssb.common.MyUtil;

@Service("mailCounsel.mailSender")
public class MailSender {
	@Autowired
	private FileManager fileManager;
	@Autowired
	private MyUtil myUtil;
	
	private String mailType;
	private String encType;
	private String pathname;
	
	public MailSender() {
		this.encType = "euc-kr";
		this.mailType = "text/html; charset = euc-kr";
		this.pathname = "c:" + File.separator + "temp" + File.separator+"mail";
	}
	
	public void setMailType(String mailType, String encType) {
		this.mailType = mailType;
		this.encType = encType;
	}
	
	public void setPathname(String pathname) {
		this.pathname = pathname;
	}
	
	// SMTP 권한
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			String username =  "ssbank.sist"; // 네이버 사용자;
	        // String username =  "지메일아이디" // gmail 사용자;  
	        String password = "Tkddyddmsgod"; // 패스워드;  
	        return new PasswordAuthentication(username, password);  
		}
	}
	
	// 첨부 파일이 있는 경우 MIME을 MultiMime로 파일을 전송한다.
	private void makeMessage(Message msg, Mail dto) throws MessagingException {
		if(dto.getUpload() == null || dto.getUpload().isEmpty()) {
			// 파일을 첨부하지 않은 경우
			msg.setText(dto.getContent());
			msg.setHeader("Content-Type", mailType);
		} else {
			// 파일을 첨부하는 경우
			
			//메일 내용
			MimeBodyPart mbp1 = new MimeBodyPart();
			mbp1.setText(dto.getContent());
			mbp1.setHeader("Content-Type", mailType);
			
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp1);
			
			// 첨부파일
			for(MultipartFile mf:dto.getUpload()) {
				if(mf.isEmpty())
					continue;
				
				try {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						dto.getSavePathname().add(pathname + File.separator + saveFilename);
						
						String originalFilename = mf.getOriginalFilename();
						MimeBodyPart mbp2 = new MimeBodyPart();
						FileDataSource fds = new FileDataSource(pathname + File.separator + saveFilename);
						mbp2.setDataHandler(new DataHandler(fds));
						
						if(originalFilename == null || originalFilename.length()==0)
							mbp2.setFileName(MimeUtility.encodeWord(fds.getName()));
						else
							mbp2.setFileName(MimeUtility.encodeWord(originalFilename));
						mp.addBodyPart(mbp2);
					}
				} catch(UnsupportedEncodingException e) {
					System.out.println(e.toString());
				} catch(Exception e) {
					System.out.println(e.toString());
				}
			}
			msg.setContent(mp);
		}
	}
	
	public boolean mailSend(Mail dto) {
		boolean b = false;
		
		Properties p = new Properties();
		
		// SMTP 서버의 계정 설정   
		// Naver와 연결할 경우 네이버 아이디
		// Gmail과 연결할 경우 Gmail 아이디
		p.put("mail.smtp.user", "ssbank.sist");   
		  
		// SMTP 서버 정보 설정   
		p.put("mail.smtp.host", "smtp.gmail.com"); // 네이버   
		// p.put("mail.smtp.host", "smtp.gmail.com"); // gmail
		       
		// 네이버와 지메일 동일   
		p.put("mail.smtp.port", "465");   
    	p.put("mail.smtp.starttls.enable", "true");   
		p.put("mail.smtp.auth", "true");   
		// p.put("mail.smtp.debug", "true");   
		p.put("mail.smtp.socketFactory.port", "465");   
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(p, auth);
			// 메일 전송시 상세 정보 콘솔에 출력 여부
			session.setDebug(true);
			
			Message msg = new MimeMessage(session);
			
			// 보내는 사람
			if(dto.getSenderName() == null || dto.getSenderName().equals(""))
				msg.setFrom(new InternetAddress(dto.getSenderEmail()));
			else 
				msg.setFrom(new InternetAddress(dto.getSenderEmail(), dto.getSenderName(), encType));
			
			// 받는사람
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dto.getReceiverEmail()));
			
			// 제목
			msg.setSubject(dto.getSubject());
			
			// HTML 형식인 경우 \r\n을 <br>로 변환
			if(mailType.indexOf("text/html") != -1) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
			makeMessage(msg, dto);
			msg.setHeader("X-Mailer", dto.getSenderName());
			
			// 메일 보낸 날짜
			msg.setSentDate(new Date());
			
			// 메일 전송
			Transport.send(msg);
			
			// 메일 전송후 서버에 저장된 첨부 파일 삭제
			if(dto.getSavePathname() != null && dto.getSavePathname().size()>0) {
				for(String filename: dto.getSavePathname()) {
					File file = new File(filename);
					if(file.exists())
						file.delete();
				}
			}
			
			b = true;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return b;
	}
}
