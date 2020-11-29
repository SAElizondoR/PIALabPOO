/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package fcfm.pia.controlador;

import fcfm.pia.modelo.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class Almacen extends HttpServlet {
  private Lista lista;

  @Override
  public void init() {
    lista = new Lista();
  }

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request,
                                HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String accion = request.getParameter("accion");

    if (request.getParameter("btnmodificar") != null) {
      accion = "Editar";
    } else if (request.getParameter("btnagregar") != null) {
      accion = "Agregar";
    }
    if (accion == null) {
      accion = "Listar";
    }
    switch (accion) {
    case "Listar":
      listarHerramientas(request, response);
      break;
    case "IrAgregar":
      irAgregarHerramientas(request, response);
      break;
    case "Agregar":
      agregarHerramientas(request, response);
      break;
    case "Eliminar":
      eliminarHerramientas(request, response);
      break;
    case "ObtenerUno":
      obtenerUnaHerramienta(request, response);
      break;
    case "Editar":
      editarHerramientas(request, response);
      break;
    }
  }

  private void listarHerramientas(HttpServletRequest request,
                                  HttpServletResponse response)
      throws ServletException, IOException {
    String filtro = "";
    String tipofiltro = "";

    if (request.getParameter("btnfiltro") != null) {
      filtro = request.getParameter("filtro");
      tipofiltro = request.getParameter("tipofiltro");
    }

    List<Herramienta> vectorLista = lista.listar(filtro, tipofiltro);
    request.setAttribute("vectorlista", vectorLista);
    request.setAttribute("tamano", vectorLista.size());
    request.setAttribute("cantCategorias", lista.contar("categoria"));
    request.setAttribute("cantMarcas", lista.contar("marca"));
    request.setAttribute("cantTamanos", lista.contar("tamano"));
    RequestDispatcher desp =
        request.getRequestDispatcher("/WEB-INF/listar.jsp");
    desp.forward(request, response);
  }

  private void irAgregarHerramientas(HttpServletRequest request,
                                     HttpServletResponse response)
      throws ServletException, IOException {
    RequestDispatcher desp =
        request.getRequestDispatcher("/WEB-INF/agregar.jsp");
    desp.forward(request, response);
  }

  private void agregarHerramientas(HttpServletRequest request,
                                   HttpServletResponse response)
      throws ServletException, IOException {
    String nombre = request.getParameter("nombre");
    String categoria = request.getParameter("categoria");
    String marca = request.getParameter("marca");
    String dimension = request.getParameter("dimension");
    int unidades = Integer.parseInt(request.getParameter("unidades"));
    lista.agregar(nombre, categoria, marca, dimension, unidades);
    listarHerramientas(request, response);
  }

  private void eliminarHerramientas(HttpServletRequest request,
                                    HttpServletResponse response)
      throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    lista.eliminar(id);
    listarHerramientas(request, response);
  }

  private void obtenerUnaHerramienta(HttpServletRequest request,
                                     HttpServletResponse response)
      throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    Herramienta herramienta = lista.obtenerUna(id);

    request.setAttribute("herramienta", herramienta);
    RequestDispatcher desp =
        request.getRequestDispatcher("/WEB-INF/editar.jsp");
    desp.forward(request, response);
  }

  private void editarHerramientas(HttpServletRequest request,
                                  HttpServletResponse response)
      throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String categoria = request.getParameter("categoria");
    String marca = request.getParameter("marca");
    String dimension = request.getParameter("dimension");
    int unidades = Integer.parseInt(request.getParameter("unidades"));
    lista.editar(id, nombre, categoria, marca, dimension, unidades);
    listarHerramientas(request, response);
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on
  // the + sign on the left to edit the code.">
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
  protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
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
  } // </editor-fold>
}
