import br.inatel.projeto.control.Arquivo;
import br.inatel.projeto.model.Casa;

import java.util.ArrayList;

public class Principal {
    public static void main(String[] args) {


        Casa casa = new Casa();
        casa.dono = "Lucas";
        casa.numQuartos = 4;
        casa.aluguel = 1300;

        Arquivo a = new Arquivo();
        a.inserir(casa);

        //FULL QUALIFIED NAME
        br.inatel.projeto.model2.Casa casaModel2 = new br.inatel.projeto.model2.Casa();
        casaModel2.endereco = "Minha casa";

        ArrayList<Casa> houses= new ArrayList();
        houses = a.buscar();

        //MVC
        //Model - classes de modelagem
        //View - Interação com o usuário
        //Controller - classes que fazem interação entre Model e View

    }
}

