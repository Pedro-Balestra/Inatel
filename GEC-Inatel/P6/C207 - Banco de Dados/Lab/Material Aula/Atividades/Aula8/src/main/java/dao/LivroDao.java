package dao;

import model.Livro;

import java.sql.SQLException;

public class LivroDao extends ConnectionDao {

    boolean sucesso = false;

    public boolean inserirLivro(Livro livro) {
        connectToDB();
        String sql = "INSERT INTO Livro (titulo, autor, numPaginas) values(?,?,?)";

        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, livro.titulo);
            pst.setString(2, livro.autor);
            pst.setInt(3, livro.numPaginas);
            pst.execute();
            sucesso = true;
        } catch(SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch(SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }

        return sucesso;
    }


    public boolean atualizarLivro(int id, Livro livro) {
        connectToDB();
        String sql = "UPDATE livro SET titulo=?, autor=?, numPaginas=? where id=?";

        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, livro.titulo);
            pst.setString(2, livro.autor);
            pst.setInt(3, livro.numPaginas);
            pst.setInt(4, id);
            pst.execute();
            sucesso = true;

        } catch(SQLException ex) {
            System.out.println("Erro = " +  ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch(SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return sucesso;
    }

    public boolean deletarLivro(int id) {
        connectToDB();
        String sql = "DELETE FROM livro where id=?";

        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            sucesso = true;

        } catch(SQLException ex) {
            System.out.println("Erro = " +  ex.getMessage());
            sucesso = false;
        } finally {
            try {
                con.close();
                pst.close();
            } catch(SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return sucesso;
    }

}
