package br.inatel.projeto.control;

import br.inatel.projeto.model.Casa;

import java.io.*;
import java.util.ArrayList;

public class Arquivo {

    public void inserir(Casa c){
        OutputStream op;
        OutputStreamWriter osw;
        BufferedWriter bw = null;

        try{

            //TRUE SALVA O ANTIGO NO ARQUIVO E ESCREVE EMBAIXO
            //FALSE APAGA O QUE TINHA NO ARQUIVO ANTES E ESCREVE O CONTEUDO NOVO
            op = new FileOutputStream("arquivo.txt", true);
            osw = new OutputStreamWriter(op);
            bw = new BufferedWriter(osw);


            bw.write("Minha primeira linha, segunda tentativa");
            bw.write("\noutra linha\n");


            br.inatel.projeto.model.Casa c1 = new br.inatel.projeto.model.Casa();
            c1.dono = "Joaquim";
            c1.numQuartos = 3;
            c1.aluguel = 1000;

            bw.write("-------------Casa-------------\n");
            bw.write(c1.dono + "\n");
            bw.write(c1.numQuartos + "\n");
            bw.write(c1.aluguel + "\n");

            br.inatel.projeto.model.Casa c2 = new br.inatel.projeto.model.Casa();
            c2.dono = "Tereza";
            c2.numQuartos = 2;
            c2.aluguel = 750;

            bw.write("-------------Casa-------------\n");
            bw.write(c2.dono + "\n");
            bw.write(c2.numQuartos + "\n");
            bw.write(c2.aluguel + "\n");
        }
        catch(IOException e){
            System.out.println(e);
        }
        finally{

            try{
                bw.close();
            }
            catch(Exception e){
                System.out.println(e);
            }
        }
    }

    public ArrayList<Casa> buscar(){
        InputStream is;
        InputStreamReader isr;
        BufferedReader br = null;
        ArrayList<Casa> casas = new ArrayList<>();

        try{
            is = new FileInputStream("arquivo.txt");
            isr = new InputStreamReader(is);
            br = new BufferedReader(isr);

            String linha = br.readLine();

            while(linha != null){
                System.out.println(linha);

                Casa cAux = new Casa();
                if(linha.contains("-Casa-")){
                    cAux.dono = br.readLine();
                    cAux.numQuartos = Integer.parseInt(br.readLine());
                    cAux.aluguel = Float.parseFloat(br.readLine());
                    casas.add(cAux);
                }
                linha = br.readLine();
            }
        }
        catch(IOException e){
            System.out.println(e);
        }
        finally{
            try{
                br.close();
            }
            catch(Exception e){
                System.out.println(e);
            }
        }

        for (int i=0; i<casas.size(); i++){
            System.out.println("-----------------------------------------");
            System.out.println("Dono: " + casas.get(i).dono);
            System.out.println("Num de quartos: " + casas.get(i).numQuartos);
            System.out.println("Aluguel: " + casas.get(i).aluguel);
        }
        return casas;
    }
}
