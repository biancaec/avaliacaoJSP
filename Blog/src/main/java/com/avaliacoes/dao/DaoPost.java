package com.avaliacoes.dao;

import com.avaliacoes.entidades.Post;
import com.avaliacoes.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPost {

    public static List<Post> buscarPosts() {
        List<Post> posts = new ArrayList<>();
        Connection connection = Conexao.conectar();

        if (connection != null) {
            try {
                String sql = "select * from post";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet result = statement.executeQuery();

                while(result.next()) {
                    Post post = new Post();
                    post.setId(result.getInt("id"));
                    post.setTitulo(result.getString("titulo"));
                    post.setConteudo(result.getString("conteudo"));
                    post.setAutorId(result.getInt("autor_id"));
                    posts.add(post);
                }
            }catch (SQLException e) {
                return posts;
            }
        }
        return posts;
    }
}
