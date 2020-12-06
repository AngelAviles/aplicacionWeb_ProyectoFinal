/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.Cliente;
import persistencia.PersistenciaBD;

/**
 *
 * @author angel
 */
@WebServlet(name = "obtenCliente", urlPatterns = {"/obtenCliente"})
public class obtenCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            IPersistencia crud = new PersistenciaBD();

            String numCredencial = request.getParameter("cred");
            String tareaSelec = (String) session.getAttribute("tarea");

            Cliente c = new Cliente(numCredencial);

            try {
                Cliente clienteObtenido = crud.obten(c);
                session.setAttribute("tarea", tareaSelec);

                if (tareaSelec.equals("agregarCliente")) {

                    if (clienteObtenido == null) {
                        session.setAttribute("numCredencial", numCredencial);

                        response.sendRedirect("capturaCliente.jsp");

                    } else {
                        session.setAttribute("cliente", clienteObtenido);

                        response.sendRedirect("desplegarCliente.jsp");
                    }

                } else if (tareaSelec.equals("editarCliente")) {

                    if (clienteObtenido == null) {
                        session.setAttribute("dato", numCredencial);
                        session.setAttribute("error", "El cliente ingresado no existe.");

                        response.sendRedirect("error.jsp");
                    } else {
                        session.setAttribute("cliente", clienteObtenido);
                        session.setAttribute("numCredencial", clienteObtenido.getNumCredencial());

                        response.sendRedirect("capturaCliente.jsp");
                    }

                } else if (tareaSelec.equals("eliminarCliente")) {

                    if (clienteObtenido == null) {
                        session.setAttribute("dato", numCredencial);
                        session.setAttribute("error", "El cliente ingresado no existe.");

                        response.sendRedirect("error.jsp");
                    } else {
                        session.setAttribute("cliente", clienteObtenido);
                        session.setAttribute("numCredencial", clienteObtenido.getNumCredencial());

                        response.sendRedirect("desplegarCliente.jsp");
                    }
                }

            } catch (Exception e) {
                response.sendRedirect("error.jsp");
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
