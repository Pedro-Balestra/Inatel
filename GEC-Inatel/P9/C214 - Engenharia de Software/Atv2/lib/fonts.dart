import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts extends StatefulWidget {
  const Fonts({super.key});

  @override
  State<Fonts> createState() => _FontsState();
}

class _FontsState extends State<Fonts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Google Fonts",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(50),
            alignment: Alignment.center,
            child: const Text(
              "Aplicação para mostrar o uso da dependecia do google fonts",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Exemplo Fonte Abel",
              style: GoogleFonts.abel(fontSize: 25, color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.5),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Escreva aqui",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              style: GoogleFonts.abel(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Exemplo Fonte AbyssinicaSil",
                style: GoogleFonts.abyssinicaSil(
                    fontSize: 25, color: Colors.black87),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.5),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Escreva aqui",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              style:
                  GoogleFonts.abyssinicaSil(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Exemplo Fonte B612Mono",
              style: GoogleFonts.b612Mono(fontSize: 25, color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.5),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "Escreva aqui",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              style: GoogleFonts.b612Mono(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
