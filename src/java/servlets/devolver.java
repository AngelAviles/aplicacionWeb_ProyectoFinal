/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.Cliente;
import objetosNegocio.Renta;
import objetosNegocio.Videojuego;
import objetosServicio.Fecha;
import persistencia.PersistenciaBD;

/**
 *
 * @author angel
 */
@WebServlet(name = "devolver", urlPatterns = {"/devolver"})
public class devolver extends HttpServlet {

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
            
            IPersistencia crud = new PersistenciaBD();

            String numCredencial = request.getParameter("cliente");
            Cliente c = new Cliente(numCredencial);

            String numCatalogo = request.getParameter("articulo");
            Videojuego v = new Videojuego(numCatalogo);

            String fecha = request.getParameter("fecha");
            String[] anioMesDia = fecha.split("-");
            Date date = new Date(Integer.parseInt(anioMesDia[0]), Integer.parseInt(anioMesDia[1]) - 1, Integer.parseInt(anioMesDia[2]));
            Fecha f = new Fecha(date);
            
            int dias = Integer.parseInt(request.getParameter("tiempoRenta"));

            Renta renta = new Renta(c, v, f, dias);

            HttpSession session = request.getSession();

            try {
                crud.devolverVideojuego(renta);
                response.sendRedirect("obtenRentasVideojuegos");
            } catch (Exception e) {
                session.setAttribute("tarea", "devolver");
                session.setAttribute("error", "Ocurrio un error de conexion... Intentar mas tarde...");
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
