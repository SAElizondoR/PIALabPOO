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
package fcfm.pia.modelo;

import fcfm.conexionbd.ConexionBD;
import java.sql.*;
import java.util.*;

public class Lista {
    private List<Herramienta> lista;
    
    public Lista() {

    }
    
    public List<Herramienta> listar(String filtro, String tipofiltro) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.obtenerConexion();
        lista = new ArrayList<>();
        String cadenaQuery = "select * from utiles";
        
        try(Statement sta = cnxObtenida.createStatement()) {
            if (!filtro.isEmpty()) {
                cadenaQuery += " WHERE " + tipofiltro + " LIKE'" + filtro + "'";
            }
            try (ResultSet rs = sta.executeQuery(cadenaQuery)) {
                while (rs.next()) {
                    Herramienta herramienta = new Herramienta();
                    herramienta.setId(rs.getInt("id"));
                    herramienta.setNombre(rs.getString("nombre"));
                    herramienta.setCategoria(rs.getString("categoria"));
                    herramienta.setMarca(rs.getString("marca"));
                    herramienta.setTamano(rs.getString("dimension"));
                    herramienta.setUnidades(rs.getInt("unidades"));
                    lista.add(herramienta);
                }
                sta.close();
            }
        }
        catch(SQLException ex) {
            StackTraceElement[] pila = ex.getStackTrace();
            System.out.println("Error al listar: ");
            for (StackTraceElement elem: pila) {
                System.out.println(elem.toString());
            }
        }
        finally {
            try {
                if (!cnxObtenida.isClosed()) {
                    cnxObtenida.close();
                }
            }
            catch(SQLException ex) {
                StackTraceElement[] pila = ex.getStackTrace();
                System.out.println("Error al cerrar conexión: ");
                for (StackTraceElement elem: pila) {
                    System.out.println(elem.toString());
                }
            }
        }
        
        return lista;
    }
    
    public List<Herramienta> agregar(String nombre, String categoria, String marca, String dimension, int unidades) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.obtenerConexion();
        
        try(Statement sta = cnxObtenida.createStatement()) {
            sta.executeUpdate("insert into utiles (nombre,categoria,marca,dimension,unidades) values('" + nombre + "','" + categoria + "','" + marca + "','" +
                    dimension + "','" + unidades + "')");
            sta.close();
        }
        catch(SQLException ex) {
            StackTraceElement[] pila = ex.getStackTrace();
            System.out.println("Error al agregar elemento: ");
            for (StackTraceElement elem: pila) {
                System.out.println(elem.toString());
            }
        }
        finally {
            try {
                if (!cnxObtenida.isClosed()) {
                    cnxObtenida.close();
                }
            }
            catch(SQLException ex) {
                StackTraceElement[] pila = ex.getStackTrace();
                System.out.println("Error al cerrar conexión: ");
                for (StackTraceElement elem: pila) {
                    System.out.println(elem.toString());
                }
            }
        }
        
        return listar("","");
    }
    
    public List<Herramienta> eliminar(int id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.obtenerConexion();
        
        try(Statement sta = cnxObtenida.createStatement()) {
            sta.executeUpdate("delete from utiles where id=" + id);
            sta.close();
        }
        catch(SQLException ex) {
            StackTraceElement[] pila = ex.getStackTrace();
            System.out.println("Error al eliminar elemento: ");
            for (StackTraceElement elem: pila) {
                System.out.println(elem.toString());
            }
        }
        finally {
            try {
                if (!cnxObtenida.isClosed()) {
                    cnxObtenida.close();
                }
            }
            catch(SQLException ex) {
                StackTraceElement[] pila = ex.getStackTrace();
                System.out.println("Error al cerrar conexión: ");
                for (StackTraceElement elem: pila) {
                    System.out.println(elem.toString());
                }
            }
        }
        
        return listar("","");
    }
    
    public Herramienta obtenerUna(int id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.obtenerConexion();
        Herramienta herramienta = new Herramienta();
        
        try(Statement sta = cnxObtenida.createStatement()) {
            ResultSet rs = sta.executeQuery("select * from utiles where id=" + id);
            herramienta.setId(id);
            herramienta.setNombre(rs.getString("nombre"));
            herramienta.setCategoria(rs.getString("categoria"));
            herramienta.setMarca(rs.getString("marca"));
            herramienta.setTamano(rs.getString("dimension"));
            herramienta.setUnidades(rs.getInt("unidades"));
            sta.close();
        }
        catch(SQLException ex) {
            StackTraceElement[] pila = ex.getStackTrace();
            System.out.println("Error al eliminar elemento: ");
            for (StackTraceElement elem: pila) {
                System.out.println(elem.toString());
            }
        }
        finally {
            try {
                if (!cnxObtenida.isClosed()) {
                    cnxObtenida.close();
                }
            }
            catch(SQLException ex) {
                StackTraceElement[] pila = ex.getStackTrace();
                System.out.println("Error al cerrar conexión: ");
                for (StackTraceElement elem: pila) {
                    System.out.println(elem.toString());
                }
            }
        }
        
        return herramienta;
    }
    
    public List<Herramienta> editar(int id, String nombre, String categoria, String marca, String dimension, int unidades) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.obtenerConexion();
        
        try(Statement sta = cnxObtenida.createStatement()) {
            sta.executeUpdate("update utiles set nombre='" + nombre + "',categoria='" + categoria + "',marca='" + marca + "', dimension='" + dimension +
                    "',unidades='" + unidades + "' where id="+ id);
            sta.close();
        }
        catch(SQLException ex) {
            StackTraceElement[] pila = ex.getStackTrace();
            System.out.println("Error al eliminar elemento: ");
            for (StackTraceElement elem: pila) {
                System.out.println(elem.toString());
            }
        }
        finally {
            try {
                if (!cnxObtenida.isClosed()) {
                    cnxObtenida.close();
                }
            }
            catch(SQLException ex) {
                StackTraceElement[] pila = ex.getStackTrace();
                System.out.println("Error al cerrar conexión: ");
                for (StackTraceElement elem: pila) {
                    System.out.println(elem.toString());
                }
            }
        }
        
        return listar("","");
    }
}
