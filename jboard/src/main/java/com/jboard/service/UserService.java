package com.jboard.service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.DAO.user.UserDAO;
import com.jboard.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	public static UserService getInstnace() {
		return instance;
	}
	
	private UserService() {}
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	private UserDAO dao = UserDAO.getInstance();
	
	
	//이메일 인증
	public String sendEmailCode(String email) {
		//인증코드 생성
		int code= ThreadLocalRandom.current().nextInt(100000,1000000);
		
		// 기본정보
		String title="jboard 인증번호 입니다.";
		String content= "<h1>인증코드는 "+code+"</h1>";
		
		String sender = "hajhi7899@gmail.com";
		String appPass = "vbvu wyqg fbpe mlmr"; //google 앱 비밀번호 입력
		
		//smtp 설정 
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		
		// gmail session 생성
		Session gmailSession = Session.getInstance(props, new Authenticator(){
			
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(sender,appPass);
			}
		});
		
		
		//메일발송
		Message message = new MimeMessage(gmailSession);
		
		try{
			message.setFrom(new InternetAddress(sender,"보내는 사람","UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject(title);
			message.setContent(content,"text/html;charset=utf-8");
			Transport.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return ""+code;
	}
	
	public void insertUser(UserDTO dto) { dao.insertUser(dto);}
	public UserDTO selectUser(String uid,String pass) {return  dao.selectUser(uid,pass);}
	public List<UserDTO> selectUsers() { return dao.selectUsers();}
	public void updateUser(UserDTO dto) {dao.updateUser(dto);}
	public void deleteUser(String uid) {dao.deleteUser(uid);}
	public int selectCountUser(String type,String value) {return  dao.selectCountUser(type,value);}
	
	
}
