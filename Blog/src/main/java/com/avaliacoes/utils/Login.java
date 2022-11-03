package com.avaliacoes.utils;

import com.avaliacoes.dao.DaoUsuario;
import com.avaliacoes.entidades.Usuario;

public class Login {
    private static Usuario user;

    public static boolean validarLogin(String email, String senha) {
        user = DaoUsuario.buscarPorEmail(email);

        if(user.getId() != 0 && user.getSenha().equals(senha)) {

            return true;
        }
        return false;
    }

    public static Usuario getUser() {
        return user;
    }
}
