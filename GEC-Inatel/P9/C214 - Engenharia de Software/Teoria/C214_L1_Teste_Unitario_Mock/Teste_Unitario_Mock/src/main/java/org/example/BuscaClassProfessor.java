package org.example;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class BuscaClassProfessor {

    ClassProfessorService professorService;

    public BuscaClassProfessor(ClassProfessorService professorService) {
        this.professorService = professorService;
    }

    public ClassProfessor buscaProfessor(String nomeProfessor){
        String professorJson =  professorService.busca(nomeProfessor);


        JsonObject jsonObject = JsonParser.parseString(professorService.toString()).getAsJsonObject();
    }
}
