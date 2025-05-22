package com.autoloan.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class AuthHelper {
	
	
    // Check if user is logged in
    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("user") != null;
    }
    
    // Store user in session after login
    public static void loginUser(HttpServletRequest request, String username) {
        HttpSession session = request.getSession();
        session.setAttribute("user", username);
    }
    
    // Logout user
    public static void logoutUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}