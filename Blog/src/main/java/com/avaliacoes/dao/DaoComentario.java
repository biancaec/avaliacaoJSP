package com.avaliacoes.dao;

import com.avaliacoes.entidades.Comentario;
import com.avaliacoes.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoComentario {
    public static boolean salvar(Comentario comentario) {
        Connection connection = Conexao.conectar();
        if(connection != null) {
            try {
                String sql = "insert into comentario (conteudo, post_id, autorizado) values (?, ?, ?);";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, comentario.getConteudo());
                statement.setInt(2, comentario.getPostId());
                statement.setBoolean(3, comentario.isAutorizado());
                statement.execute();
            } catch (SQLException e) {
                return false;
            }
        }
        return true;
    }

    public static List<Comentario> buscarComentarios() {
        List<Comentario> comentarios = new ArrayList<>();
        Connection connection = Conexao.conectar();

        if (connection != null) {
            try {
                String sql = "select * from comentario";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet result = statement.executeQuery();

                while(result.next()) {
                    Comentario comentario = new Comentario();
                    comentario.setId(result.getInt("id"));
                    comentario.setConteudo(result.getString("conteudo"));
                    comentario.setPostId(result.getInt("post_id"));
                    comentario.setAutorizado(result.getBoolean("autorizado"));
                    comentarios.add(comentario);
                }
            }catch (SQLException e) {
                return comentarios;
            }
        }
        return comentarios;
    }

    public static boolean aceitarComentario(int id) {
        Connection connection = Conexao.conectar();

        if (connection != null) {
            try {
                String sql = "update comentario set autorizado = true where id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();

            }catch (SQLException e) {
                return false;
            }
        }
        return true;
    }
}
