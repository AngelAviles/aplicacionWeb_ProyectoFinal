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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.Cliente;
import objetosNegocio.Videojuego;
import objetosServicio.Fecha;
import objetosServicio.Periodo;
import persistencia.PersistenciaBD;

/**
 *
 * @author angel
 */
@WebServlet(name = "obtenRentas", urlPatterns = {"/obtenRentas"})
public class obtenRentas extends HttpServlet {

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
            String cliente = (String) request.getParameter("cliente");
            String videojuego = (String) request.getParameter("videojuego");
            String desde = (String) request.getParameter("desde");
            String hasta = (String) request.getParameter("hasta");

            IPersistencia crud = new PersistenciaBD();

            List lista = null;
            if (!cliente.equalsIgnoreCase("")) {
                Cliente c = new Cliente(cliente);
                lista = crud.consultarRentasVideojuegos(c);
            } else if (!videojuego.equalsIgnoreCase("")) {
                Videojuego v = new Videojuego(videojuego);
                lista = crud.consultarRentas(v);
            } else if (!desde.equalsIgnoreCase("") && !hasta.equalsIgnoreCase("")) {
                String[] anioMesDiaDesde = desde.split("-");
                Date dateDesde = new Date(Integer.parseInt(anioMesDiaDesde[0]) - 1900, Integer.parseInt(anioMesDiaDesde[1]) - 1, Integer.parseInt(anioMesDiaDesde[2]));
                Fecha fechaDesde = new Fecha(dateDesde);
                
                String[] anioMesDiaHasta = hasta.split("-");
                Date dateHasta = new Date(Integer.parseInt(anioMesDiaHasta[0]) - 1900, Integer.parseInt(anioMesDiaHasta[1]) - 1, Integer.parseInt(anioMesDiaHasta[2]));
                Fecha fechaHasta = new Fecha(dateHasta);
                
                Periodo periodo = new Periodo(fechaDesde, fechaHasta);
                
                lista = crud.consultarRentasVideojuegos(periodo);
            }

            session.setAttribute("listaRentas", lista);

            response.sendRedirect("desplegarRentasEncontradas.jsp");
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
