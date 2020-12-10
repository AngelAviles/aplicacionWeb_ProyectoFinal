/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angel Aviles/Gildardo Ortega
 */
@WebServlet(name = "control", urlPatterns = {"/control"})
public class control extends HttpServlet {

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

            String tareaSelec = request.getParameter("tarea");
            HttpSession session = request.getSession();
            session.setAttribute("tarea", tareaSelec);

            if (tareaSelec.equals("listarClientes")) {
                response.sendRedirect("obtenClientes");
            } else if (tareaSelec.equals("agregarCliente")) {
                response.sendRedirect("capturaNumCredencial.jsp");

                //AgregarVideojuego
            } else if (tareaSelec.equals("agregarVideojuego")) {
                response.sendRedirect("capturaNumCatalogo.jsp");

                //Eliminar Videojuego
            } else if (tareaSelec.equals("eliminarVideojuego")) {
                response.sendRedirect("capturaNumCatalogo.jsp");

                //listar Videojuegos
            } else if (tareaSelec.equals("listarVideojuegos")) {
                response.sendRedirect("obtenVideojuegos");

                //editar Videojeugo
            } else if (tareaSelec.equals("editarVideojuego")) {
                response.sendRedirect("capturaNumCatalogo.jsp");

            } else if (tareaSelec.equals("editarCliente")) {
                response.sendRedirect("capturaNumCredencial.jsp");
            } else if (tareaSelec.equals("eliminarCliente")) {
                response.sendRedirect("capturaNumCredencial.jsp");
            } else if (tareaSelec.equals("inventarear")) {
                response.sendRedirect("obtenVideojuegos");
            } else if (tareaSelec.equals("desinventarear")) {
                response.sendRedirect("obtenVideojuegos");
            } else if (tareaSelec.equals("rentar")) {
                response.sendRedirect("obtenVideojuegosDisponibles");
            } else if (tareaSelec.equals("devolver")) {
                response.sendRedirect("busquedaDeRentas.jsp");
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
