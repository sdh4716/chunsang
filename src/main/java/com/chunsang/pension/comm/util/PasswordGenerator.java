package com.chunsang.pension.comm.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {

	
	public static void main(String[] args) {
		
		
		try{
			
			final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
				//String id = "ksalt";
				String pass = "tkfk7767";
				
				String pw = encoder.encode(pass);
				
				System.out.println("' " + pw + " '");
				
			} catch(NullPointerException e) {
				e.printStackTrace();
			} catch(ClassCastException e) {
				e.printStackTrace();
			} catch(Exception e){
				e.printStackTrace();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
	
}
