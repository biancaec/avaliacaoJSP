package com.avaliacoes.utils;

import java.sql.Connection;
import java.sql.SQLException;

import static java.sql.DriverManager.getConnection;

public class Conexao {

    public static Connection conectar() {
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/blog";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            connection = getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
