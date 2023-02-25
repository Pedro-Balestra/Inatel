public class Biblioteca {

    String nome;
    int anoFundacao;
    Livro[] livros = new Livro[10];

    void addLivro(Livro livro){
        for(int i=0; i<livros.length; i++){
            if(livros[i] == null){
                livros[i] = livro;
                break;
            }
        }
    }

    int tempoAberta(){
        return 2021 - anoFundacao;
    }

    void mostraInfo(){
        System.out.println("Nome da Biblioteca: " + nome);
        System.out.println("Ano da Fundação: " + anoFundacao);
        for(int i=0; i<livros.length; i++){
            if(livros[i] != null){
                livros[i].mostraInfo();
            }
        }
    }
}
