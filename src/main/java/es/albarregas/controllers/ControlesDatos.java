package es.albarregas.controllers;

import es.albarregas.beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javier
 */
@WebServlet(name = "ControlesDatos", urlPatterns = {"/ControlesDatos"})
public class ControlesDatos extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Inicio</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Inicio at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

        String boton = request.getParameter("button");

        // Si el boton es eliminar, elimino la sesion y redirijo a index.jsp
        switch (boton) {
            case "Eliminar":
                request.getSession().removeAttribute("USU");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Cancelar":
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                boolean error = false;

                if (request.getParameter("id").equals("") || request.getParameter("nombre").equals("")
                        || request.getParameter("num").equals("") || request.getParameter("fecha").equals("")) {
                    error = true;
                }

                if (!error) {
                    
                     Usuario usu = new Usuario();
                    
                    int id = Integer.parseInt(request.getParameter("id"));                  
                    usu.setId(id);
                    
                    String nombre = request.getParameter("nombre");
                    usu.setNombre(nombre);
                    
                    String fecha = request.getParameter("fecha");
                    // Formateo la fecha
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = null;
                    try {
                        date = sdf.parse(fecha);
                        usu.setFecha(date);
                        
                    } catch (Exception e) {
                      e.getMessage();
                    }
                    String num = request.getParameter("num");
                    usu.setIdentificador(num);
                    
                    String tipo = request.getParameter("tipo");
                  
               
                    switch (tipo) {
                        case "DNI":

                         usu.setTipo(Usuario.document.DNI);
                            break;
                        case "NIF":
                            
                           usu.setTipo(Usuario.document.NIE);
                            break;
                        case "PASAPORTE":

                           usu.setTipo(Usuario.document.PASAPORTE);
                            break;
                    }
                    

                   
                    request.getSession().setAttribute("USU", usu);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("JSP/crear.jsp").forward(request, response);
                }
                break;

        }

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
