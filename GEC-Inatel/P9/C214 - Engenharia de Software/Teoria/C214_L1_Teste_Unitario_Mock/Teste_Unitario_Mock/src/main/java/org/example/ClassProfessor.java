package org.example;

import java.util.ArrayList;

public class ClassProfessor {

    private String nomeDoProfessor;
    private String horarioDeAtendimento;
    private String periodo;
    private String sala;
    ArrayList<Integer> predio = new ArrayList<Integer>();

    public ClassProfessor(String nomeDoProfessor, String horarioDeAtendimento, String periodo, String sala, ArrayList<Integer> predio) {
        this.nomeDoProfessor = nomeDoProfessor;
        this.horarioDeAtendimento = horarioDeAtendimento;
        this.periodo = periodo;
        this.sala = sala;
        this.predio = predio;
    }

    public void setNomeDoProfessor(String nomeDoProfessor) {
        this.nomeDoProfessor = nomeDoProfessor;
    }

    public void setHorarioDeAtendimento(String horarioDeAtendimento) {
        this.horarioDeAtendimento = horarioDeAtendimento;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public void setPredio(ArrayList<Integer> predio) {
        this.predio = predio;
    }

    public String getNomeDoProfessor() {
        return nomeDoProfessor;
    }

    public String getHorarioDeAtendimento() {
        return horarioDeAtendimento;
    }

    public String getPeriodo() {
        return periodo;
    }

    public String getSala() {
        return sala;
    }

    public ArrayList<Integer> getPredio() {
        return predio;
    }


}
