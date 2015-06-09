package gr.uoa.di.storemanagement.rights;

import gr.uoa.di.storemanagement.datalayer.entities.product.PriceCalculation;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailVerification {

	private static EmailVerification singleInstance;
	private String verificationCode;
	private UserForApproval user;
	private UserForApprovalDaoImpl usDao = new UserForApprovalDaoImpl();

	private EmailVerification() {
	}

	public static EmailVerification getInstance() {
		if (singleInstance == null) {
			synchronized (PriceCalculation.class) {
				if (singleInstance == null) {
					singleInstance = new EmailVerification();
				}
			}
		}
		return singleInstance;
	}

	public void send(String username, String email) {
		synchronized (singleInstance) {
			verificationCode = SupplierVerificationCode.emailVerificationCode();

			user = usDao.read(username);
			user.setVerificationCode(verificationCode);
			usDao.update(user);

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("e.warehouse1991", "std09051");
						}
					});

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("e.warehouse1991@gmail.com"));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
				message.setSubject("e-Warehouse account activation");
				message.setText("Dear " + user.getFirstName()+ " " + user.getLastName() + "," + 
						"\n\n" +
						"\nAfter your request a new account for e-Warehouse" + 
						"\nservice has been created." + 
						"\n" + 
						"\nTo proceed with your account activation we require you to verify the email" + 
						"\naddress you provided during the signup process." + 
						"\n" + 
						"\nPlease click the link below to complete verification:" + 
						"\n" + 
						"\nhttp://localhost:8080/storemanagement/Account_activation?code=" + verificationCode + 
						"\n" + 
						"\n" + 
						"\nIf you did not sign up for this account you can ignore this email and the" + 
						"\naccount will be deleted." + 
						"\n" + 
						"\n" + 
						"\nFor any remarks or problems you may contact support@e-warehouse.com." + 
						"\n" + 
						"\nThank you for participating in e-Warehouse." + 
						"\n" + 
						"\ne-Warehouse team" + 
						"\n");

				Transport.send(message);

				System.out.println("Done");

			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}
	}

}
