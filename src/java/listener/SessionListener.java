package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener {

    private static int activeSessions = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        activeSessions++;
        System.out.println("Session Created: " + se.getSession().getId());
        System.out.println("Active Sessions: " + activeSessions);
        
        // Store in ServletContext if needed
        se.getSession().getServletContext().setAttribute("activeSessions", activeSessions);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        activeSessions--;
        System.out.println("Session Destroyed: " + se.getSession().getId());
        System.out.println("Active Sessions: " + activeSessions);
        
        se.getSession().getServletContext().setAttribute("activeSessions", activeSessions);
    }

    public static int getActiveSessions() {
        return activeSessions;
    }
}