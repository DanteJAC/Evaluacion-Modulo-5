package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Esta clase maneja todas las operaciones relacionadas con la base de datos para la entidad Usuario.
public class UsuarioDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/basededatos";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    private Connection conn; // Conexión a la base de datos a nivel de clase

    // Constructor que inicializa la conexión a la base de datos
    public UsuarioDAO() {
        conn = getConnection();
    }

    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM usuarios WHERE username = ? AND password = ?";

    // Método para obtener una conexión a la base de datos
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Método para validar las credenciales de usuario
    public Usuario validar(Usuario usuario) {
        Usuario usuarioValidado = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {
            preparedStatement.setString(1, usuario.getUsername());
            preparedStatement.setString(2, usuario.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                usuarioValidado = new Usuario();
                usuarioValidado.setId(rs.getInt("id"));
                usuarioValidado.setUsername(rs.getString("username"));
                usuarioValidado.setPassword(rs.getString("password"));
                usuarioValidado.setSaldo(rs.getDouble("saldo"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuarioValidado;
    }

    // Método para realizar una transferencia de saldo entre cuentas
    public boolean realizarTransferencia(String origen, String destino, double monto) {
        System.out.println("Iniciando transferencia de " + origen + " a " + destino + " por monto de " + monto);
        try {
            // Verificar si el saldo del origen es suficiente para la transferencia
            String sql = "SELECT saldo FROM usuarios WHERE username = ?";
            PreparedStatement statement = conn.prepareStatement(sql); // Utilizar la conexión a nivel de clase
            statement.setString(1, origen);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                double saldoOrigen = result.getDouble("saldo");
                System.out.println("Saldo antes de la transferencia: " + saldoOrigen);
                System.out.println("Monto a transferir: " + monto);

                if (saldoOrigen >= monto) {
                    // Realizar la transferencia
                    sql = "UPDATE usuarios SET saldo = saldo - ? WHERE username = ?";
                    PreparedStatement updateOrigen = conn.prepareStatement(sql);
                    updateOrigen.setDouble(1, monto);
                    updateOrigen.setString(2, origen);
                    int rowsUpdatedOrigen = updateOrigen.executeUpdate();
                    System.out.println("Filas actualizadas para la cuenta de origen: " + rowsUpdatedOrigen);

                    sql = "UPDATE usuarios SET saldo = saldo + ? WHERE username = ?";
                    PreparedStatement updateDestino = conn.prepareStatement(sql);
                    updateDestino.setDouble(1, monto);
                    updateDestino.setString(2, destino);
                    int rowsUpdatedDestino = updateDestino.executeUpdate();
                    System.out.println("Filas actualizadas para la cuenta de destino: " + rowsUpdatedDestino);

                    if (rowsUpdatedOrigen > 0 && rowsUpdatedDestino > 0) {
                        System.out.println("Transferencia realizada con éxito.");
                        return true; // Transferencia exitosa
                    } else {
                        System.out.println("Error al actualizar los saldos.");
                    }
                } else {
                    System.out.println("Saldo insuficiente para la transferencia.");
                    return false; // Transferencia fallida
                }
            } else {
                System.out.println("Cuenta de origen no encontrada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Transferencia fallida por error
    }

    // Método para obtener el saldo de un usuario dado su nombre de usuario
    public double obtenerSaldoDelUsuario(String username) {
        double saldo = 0.0;
        try {
            // Consulta SQL para obtener el saldo del usuario
            String sql = "SELECT saldo FROM usuarios WHERE username = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();

            // Si se encuentra el usuario, obtener su saldo
            if (result.next()) {
                saldo = result.getDouble("saldo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return saldo;	
    }

 // Método para depositar dinero en la cuenta de un usuario
    public boolean depositardinero(String username, double monto) {
        try {
            String sql = "UPDATE usuarios SET saldo = saldo + ? WHERE username = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setDouble(1, monto);
            statement.setString(2, username);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Depósito de dinero realizado con éxito.");
                return true; // Depósito exitoso
            } else {
                System.out.println("Error al realizar el depósito de dinero.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Depósito fallido por error
    }
}