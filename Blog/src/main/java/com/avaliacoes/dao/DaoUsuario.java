package com.avaliacoes.dao;

import com.avaliacoes.entidades.Usuario;
import com.avaliacoes.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

    public static Usuario buscarPorEmail(String email) {
        Usuario user = new Usuario();
        Connection connection = Conexao.conectar();

        if(connection != null) {
            try {
                PreparedStatement stm = connection.prepareStatement("select * from usuario"+
                                                                     " where email = ?;");
                stm.setString(1, email);
                ResultSet result = stm.executeQuery();

                if(result.next()) {
                    user.setId(result.getInt("id"));
                    user.setNome(result.getString("nome"));
                    user.setEmail(result.getString("email"));
                    user.setSenha(result.getString("senha"));
                    user.setPerfilId(result.getInt("perfil_id"));
                }
            }catch (SQLException e) {
                return user;
            }
        }
        return user;
    }
}
