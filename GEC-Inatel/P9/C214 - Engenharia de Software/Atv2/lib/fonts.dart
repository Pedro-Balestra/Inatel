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
      appBar: AppBar(
        title: const Text(
          "Google Fonts",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Aplicação para mostrar o uso da dependecia do google fonts",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text("Exemplo Fonte 1",
                  style: GoogleFonts.abel(fontSize: 30, color: Colors.red),

          )
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text("Exemplo Fonte 2",
                style: GoogleFonts.abyssinicaSil(fontSize: 30,color: Colors.blue)

              )
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text("Exemplo Fonte 3",
                  style: GoogleFonts.b612Mono(fontSize: 30,color: Colors.orange)

              )
          ),
        ],
      ),
    );
  }
}
