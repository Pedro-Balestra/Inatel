import java.io.*;
import java.util.ArrayList;

public class Principal {

    public static void main(String[] args) {

        OutputStream op;
        OutputStreamWriter osw;
        BufferedWriter bw = null;

        try {
            //TRUE SALVA O ANTIGO NO ARQUIVO E ESCREVE EMBAIXO
            //FALSE APAGA O QUE TINHA NO ARQUIVO ANTES E ESCREVE O CONTEUDO NOVO
            op = new FileOutputStream("arquivo.txt", true);
            osw = new OutputStreamWriter(op);
            bw = new BufferedWriter(osw);


        } catch (IOException e) {
            System.out.println(e);
        } finally {

            try {
                bw.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        InputStream is;
        InputStreamReader isr;
        BufferedReader br = null;

        try {
            is = new FileInputStream("arquivo.txt");
            isr = new InputStreamReader(is);
            br = new BufferedReader(isr);


        } catch (IOException e) {
            System.out.println(e);
        } finally {
            try {
                br.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    
    }
}
