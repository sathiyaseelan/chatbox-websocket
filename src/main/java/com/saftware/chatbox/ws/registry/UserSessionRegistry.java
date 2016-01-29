package com.saftware.chatbox.ws.registry;

import java.util.HashMap;

import javax.websocket.Session;

public class UserSessionRegistry {

	private static HashMap<String,Session> userSessionMap = new HashMap<String,Session>(); 
	
	private UserSessionRegistry(){
		
	}
	
	public static boolean mapUserWithSession(String userName,Session session){
		if(session!=null && userName!=null && userSessionMap.get(userName)==null){
			userSessionMap.put(userName, session);
			return true;
		}
		return false;
	}
	
	public static boolean removeUserWithSession(String userName){
		if( userName!=null && userSessionMap.get(userName)!=null){
			userSessionMap.remove(userName);
			return true;
		}
		return false;
	}
	
	public static Session getSession(String userName){
		return userSessionMap.get(userName);
	}
}
