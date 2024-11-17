import 'dart:math';
import 'package:flutter/material.dart';

class MotivationalScreen extends StatefulWidget {
  const MotivationalScreen({super.key});

  @override
  _MotivationalScreenState createState() => _MotivationalScreenState();
}

class _MotivationalScreenState extends State<MotivationalScreen> {
  List<String> frases = [
    "Acredite em si mesmo!",
    "Você é capaz!",
    "Nunca desista!",
    "Nada é tão ruim que não possa piorar!"
  ];
  String fraseAtual = "Clique para sortear uma frase";

  void sortearFrase() {
    final random = Random();
    setState(() {
      fraseAtual = frases[random.nextInt(frases.length)];
    });
  }

  void adicionarFrase(String novaFrase) {
    if (novaFrase.isNotEmpty) {
      setState(() {
        frases.add(novaFrase);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frase Motivacional de Hoje'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController controller = TextEditingController();
                  return AlertDialog(
                    title: const Text("Digite a frase que deseja adicionar:"),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(hintText: "Digite sua frase aqui"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          adicionarFrase(controller.text);
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Frase motivacional de hoje:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              fraseAtual,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: sortearFrase,
              child: const Text(
                "Sortear Frase",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
