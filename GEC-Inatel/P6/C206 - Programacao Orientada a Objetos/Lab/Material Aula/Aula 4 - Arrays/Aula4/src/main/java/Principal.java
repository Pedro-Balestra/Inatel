import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        //ARRAY
        /*String[] frutas = new String[5];
        frutas[0] = "Maçã";
        frutas[1] = "Abacaxi";
        frutas[2] = "Nespera";
        frutas[3] = "Maracujá";
        frutas[4] = "Morango";

        System.out.println(frutas[3]);

        System.out.println("--------------------------");


        Livro l1 = new Livro();
        l1.titulo = "Harry Potter e a Ordem da Fênix";
        l1.autor = "J K Rowling";
        l1.numPaginas = 702;

        l1.mostraInfo();


        Biblioteca b = new Biblioteca();
        b.nome = "Biblioteca de Hogwarts";
        b.anoFundacao = 1275;
        System.out.println(b.livros[0]);//posição nao instanciada
        b.livros[0] = new Livro();
        b.livros[0].titulo = "Eragon";
        b.livros[0].autor = "Christopher Paolini";
        b.livros[0].numPaginas = 400;

        b.addLivro(l1);
        b.mostraInfo();

        System.out.println("--------------------------");
        //AGREGAÇÃO
        Livro[] livrinhos = new Livro[10];
        livrinhos[0] = new Livro();
        livrinhos[0].titulo = "Crepúsculo";
        livrinhos[0].autor = "Stephanie Meyer";
        livrinhos[0].numPaginas = 350;
        b.livros = livrinhos;
        b.mostraInfo();
        */

        Scanner sc = new Scanner(System.in);
        int op = -1;

        Biblioteca livraria = new Biblioteca();


        while(op != 0){
            System.out.println("[1] - Add Livro");
            System.out.println("[2] - Mostrar dados");
            System.out.println("[0] - Sair");
            System.out.println("Entre com a opção");
            op = sc.nextInt();

            switch(op){
                case 1:
                    Livro lAux = new Livro();
                    sc.nextLine();
                    System.out.println("Entre com o título");
                    lAux.titulo = sc.nextLine();
                    System.out.println("Autor");
                    lAux.autor = sc.nextLine();
                    System.out.println("Num de paginas");
                    lAux.numPaginas = sc.nextInt();
                    livraria.addLivro(lAux);
                    break;
                case 2:
                    livraria.mostraInfo();
                    break;
            }
        }

    }
}
