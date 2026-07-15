package listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("=== SkillHub Training Academy Application Started ===");
        System.out.println("Application deployed at: " + sce.getServletContext().getContextPath());
        
        // Store application startup info in ServletContext
        sce.getServletContext().setAttribute("appName", "SkillHub Training Academy");
        sce.getServletContext().setAttribute("appVersion", "1.0");
        sce.getServletContext().setAttribute("startupTime", new java.util.Date().toString());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("=== SkillHub Training Academy Application Shutting Down ===");
    }
}