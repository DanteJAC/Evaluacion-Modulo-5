package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Usuario;
import modelo.UsuarioDAO;

@WebServlet("/controlador")
public class Controlador extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Acción recibida: " + action);

        if (action != null) {
            if (action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Usuario usuario = new Usuario();
                usuario.setUsername(username);
                usuario.setPassword(password);
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                Usuario usuarioValidado = usuarioDAO.validar(usuario);
                if (usuarioValidado != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", usuarioValidado.getUsername());
                    session.setAttribute("saldo", usuarioValidado.getSaldo());
                    request.setAttribute("username", usuarioValidado.getUsername());
                    request.setAttribute("saldo", usuarioValidado.getSaldo());
                    request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Usuario o contraseña incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else if (action.equals("transferir")) {
                String origen = request.getParameter("origen");
                String destino = request.getParameter("destino");
                double monto = Double.parseDouble(request.getParameter("monto"));
                System.out.println("Transferencia solicitada desde " + origen + " a " + destino + " por monto " + monto);

                UsuarioDAO usuarioDAO = new UsuarioDAO();
                boolean transferenciaExitosa = usuarioDAO.realizarTransferencia(origen, destino, monto);
                if (transferenciaExitosa) {
                    double saldoActualizado = usuarioDAO.obtenerSaldoDelUsuario(origen);
                    HttpSession session = request.getSession();
                    session.setAttribute("saldo", saldoActualizado);
                    request.setAttribute("saldo", saldoActualizado);
                    request.setAttribute("mensaje", "Transferencia realizada con éxito");
                    request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "No se pudo realizar la transferencia. Saldo insuficiente o error desconocido.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else if (action.equals("depositar")) {
                HttpSession session = request.getSession();
                String username = (String) session.getAttribute("username");
                double monto = Double.parseDouble(request.getParameter("monto"));
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                boolean depositoExitoso = usuarioDAO.depositardinero(username, monto);
                if (depositoExitoso) {
                    double saldoActualizado = usuarioDAO.obtenerSaldoDelUsuario(username);
                    session.setAttribute("saldo", saldoActualizado);
                    request.setAttribute("saldo", saldoActualizado);
                    request.setAttribute("mensaje", "Depósito de dinero realizado con éxito");
                    request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Error al realizar el depósito de dinero");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Acción recibida: " + action);

        if (action != null) {
            if (action.equals("login")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (action.equals("transferir")) {
                request.getRequestDispatcher("transferencias.jsp").forward(request, response);
            }
        } else {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            if (username != null) {
                UsuarioDAO usuarioDAO = new UsuarioDAO();
                double saldo = usuarioDAO.obtenerSaldoDelUsuario(username);
                request.setAttribute("saldo", saldo);

                String mensajeTransferencia = (String) session.getAttribute("mensaje");
                if (mensajeTransferencia != null) {
                    request.setAttribute("mensaje", mensajeTransferencia);
                    session.removeAttribute("mensaje");
                }

                request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
}
