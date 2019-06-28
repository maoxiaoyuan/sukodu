package com.sudoku.biz.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;

public class CodeBiz {
    /**
     *@2  邮箱初始化
     */
    public static String account="sudoku899@163.com";//你的163邮箱

    public static String password="sudoku899";//你的密码

    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    // 126邮箱的 SMTP 服务器地址为: smtp.126.com
    // qq邮箱的 SMTP 服务器地址为: smtp.qq.com
    public static String myEmailSMTPHost = "smtp.163.com";

    //发送邮件的方法
    public static void sendEmail(String to,String code) {//to发送到哪个邮箱，code随机生成的六位验证码
        // 1.创建连接对象，链接到邮箱服务器
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        // 2.根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(account,password);
            }
        });
        try {
            // 3.创建邮件对象
            Message message = new MimeMessage(session);
            // 3.1设置发件人
            message.setFrom(new InternetAddress(account));
            // 3.2设置收件人
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 3.3设置邮件的主题
            message.setSubject("Love");
            // 3.4设置邮件的正文
            //message.setContent("<h1>您的验证码是：</h1><h3><a href='http://localhost:10080/Demo_JavaMail/active?code=" + code + "'>http://localhost:10080/Demo_JavaMail/active?code=" + code + "</h3>", "text/html;charset=UTF-8");

            message.setContent("<h1>来自九宫格民宿的呼唤，您的验证码是：" + code, "text/html;charset=UTF-8");
            // 4.发送邮件
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
