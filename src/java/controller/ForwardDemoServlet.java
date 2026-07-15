package controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ForwardDemoServlet")
public class ForwardDemoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Set attribute to be forwarded
        request.setAttribute("message", "This message was forwarded using RequestDispatcher");
        request.setAttribute("timestamp", new java.util.Date().toString());

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("forwardDemo.jsp");
        dispatcher.forward(request, response);
    }
}