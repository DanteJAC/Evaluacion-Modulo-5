package modelo;

// Esta clase representa la entidad Usuario en la base de datos.
public class Usuario {
    private int id; // Identificador único del usuario
    private String username; // Nombre de usuario
    private String password; // Contraseña del usuario
    private double saldo; // Saldo asociado al usuario

    // Método constructor por defecto
    public Usuario() {
    }

    // Getters y setters para acceder y establecer los atributos de la clase

    // Método getter para obtener el ID del usuario
    public int getId() {
        return id;
    }

    // Método setter para establecer el ID del usuario
    public void setId(int id) {
        this.id = id;
    }

    // Método getter para obtener el nombre de usuario
    public String getUsername() {
        return username;
    }

    // Método setter para establecer el nombre de usuario
    public void setUsername(String username) {
        this.username = username;
    }

    // Método getter para obtener la contraseña del usuario
    public String getPassword() {
        return password;
    }

    // Método setter para establecer la contraseña del usuario
    public void setPassword(String password) {
        this.password = password;
    }

    // Método getter para obtener el saldo del usuario
    public double getSaldo() {
        return saldo;
    }

    // Método setter para establecer el saldo del usuario
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}
