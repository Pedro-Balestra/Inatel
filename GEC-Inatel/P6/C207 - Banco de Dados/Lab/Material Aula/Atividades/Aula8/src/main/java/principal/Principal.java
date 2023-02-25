package principal;

import dao.LivroDao;
import model.Livro;

public class Principal {

    public static void main(String[] args){
        LivroDao lDao = new LivroDao();

        Livro l1 = new Livro();
        l1.titulo = "God of War";
        l1.autor = "J. M. Barlog";
        l1.numPaginas = 424;

        //inserir--------------------------
        if(lDao.inserirLivro(l1)){
            System.out.println("Livro Inserido!");
        }

        else{
            System.out.println("Alguma coisa deu errado!");
        }

        //alterar--------------------------
        l1.numPaginas = 318;
        if(lDao.atualizarLivro(1, l1)){
            System.out.println("Livro alterado");
        }

        else{
            System.out.println("Alguma coisa n rolou");
        }

        //deletar---------------------------
        if(lDao.deletarLivro(3)){
            System.out.println("Livro deletado");
        }
        else{
            System.out.println("Alguma coisa n rolou");
        }
    }
}
