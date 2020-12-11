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
import objetosNegocio.ArticuloED;
import objetosNegocio.Cliente;
import objetosNegocio.Videojuego;
import persistencia.PersistenciaBD;

/**
 *
 * @author Angel Aviles/Gildardo Ortega
 */
@WebServlet(name = "obtenVideojuego", urlPatterns = {"/obtenVideojuego"})
public class obtenVideojuego extends HttpServlet {

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

            String numCatalogo = request.getParameter("numCatalogo");
            String tareaSelec = (String) session.getAttribute("tarea");

            Videojuego v = new Videojuego(numCatalogo);

            try {
                Videojuego videojuegoObtenido = crud.obten(v);
                session.setAttribute("tarea", tareaSelec);

                if (tareaSelec.equals("agregarVideojuego")) {

                    if (videojuegoObtenido == null) {
                        session.setAttribute("numCatalogo", numCatalogo);

                        response.sendRedirect("capturaVideojuego.jsp");

                    } else {
                        session.setAttribute("videojuego", videojuegoObtenido);

                        response.sendRedirect("desplegarVideojuego.jsp");
                    }

                } else if (tareaSelec.equals("editarVideojuego")) {

                    if (videojuegoObtenido == null) {
                        session.setAttribute("dato", numCatalogo);
                        session.setAttribute("error", "El Videojuego ingresado no existe.");

                        response.sendRedirect("error.jsp");
                    } else {
                        session.setAttribute("videojuego", videojuegoObtenido);
                        session.setAttribute("numCatalogo", videojuegoObtenido.getNumCatalogo());

                        response.sendRedirect("capturaVideojuego.jsp");
                    }

                } else if (tareaSelec.equals("eliminarVideojuego")) {

                    if (videojuegoObtenido == null) {
                        session.setAttribute("dato", numCatalogo);
                        session.setAttribute("error", "El Videojuego ingresado no existe.");

                        response.sendRedirect("error.jsp");
                    } else {
                        
                        List rentasVideojuego = crud.consultarRentas(videojuegoObtenido);
                        List lista = crud.consultarInventarioVideojuegos();
                        ArticuloED articulo = null;
                        
                        for (int i = 0; i < lista.size(); i++) {
                            ArticuloED a = (ArticuloED) lista.get(i);
                            
                            if (a.getArticulo().getNumCatalogo().equalsIgnoreCase(videojuegoObtenido.getNumCatalogo())) {
                                articulo = a;
                                break;
                            }
                        }

                        session.setAttribute("videojuego", videojuegoObtenido);
                        session.setAttribute("numCatalogo", videojuegoObtenido.getNumCatalogo());
                        session.setAttribute("videojuegoRentas", rentasVideojuego);
                        session.setAttribute("articulo", articulo);

                        response.sendRedirect("desplegarVideojuego.jsp");
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
