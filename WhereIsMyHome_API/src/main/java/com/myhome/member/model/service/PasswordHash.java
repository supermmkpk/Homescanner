package com.myhome.member.model.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * <pre>
 * SHA-256 해싱 알고리즘을 이용한 비밀번호를 암호화 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public class PasswordHash {
	private static PasswordHash passwordHash = new PasswordHash();
	
	private PasswordHash() {}
	
	public static PasswordHash getInstance() {
		return passwordHash;
	}

    public String get_SHA_256_SecurePassword(String passwordToHash) {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            //md.update(salt);
            byte[] bytes = md.digest(passwordToHash.getBytes());
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    //솔트를 생성하는 메소드입니다.
    public byte[] getSalt() {
        SecureRandom sr = null;
        try {
            sr = SecureRandom.getInstanceStrong();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }
}
