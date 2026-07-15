package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Trainer;
import service.DataStore;

@WebServlet("/TrainerServlet")
public class TrainerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");

        Trainer trainer = new Trainer(id, name, specialization);
        DataStore.trainers.add(trainer);

        response.sendRedirect("trainers.jsp");
    }
}