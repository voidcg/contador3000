import 'package:flutter/material.dart';

void main() {
  runApp(const Contador3000App());
}

// Widget principal do app
class Contador3000App extends StatelessWidget {
  const Contador3000App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador 3000',
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: const HomeScreen(), // Chama a tela inicial
    );
  }
}

// Tela inicial com estado (contador muda)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int vontade = 0; // Variável que guarda o valor da vontade

  // Função que incrementa a vontade
  void aumentarVontade() {
    setState(() {
      vontade++;
    });
  }

  // Função que zera a vontade
  void zerarVontade() {
    setState(() {
      vontade = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 31, 62), // Fundo azul escuro
      body: Stack(
        children: [
          // Conteúdo central da tela
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '🎮', // Emoji de controle
                  style: TextStyle(fontSize: 60),
                ),
                const SizedBox(height: 16), // Espaço entre os elementos
                const Text(
                  'Toque no botão para aumentar a sua vontade de jogar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, // Texto branco
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: aumentarVontade, // Chama a função ao clicar
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Botão vermelho
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Botão',
                    style: TextStyle(
                      color: Colors.white, // Texto branco
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Você está com $vontade x de vontade de jogar',
                  style: const TextStyle(
                    color: Colors.white, // Texto branco
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Botão "Zerar" fixado na parte inferior central
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ElevatedButton(
                onPressed: zerarVontade, // Chama a função ao clicar
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Cor branca
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Zerar',
                  style: TextStyle(
                    color: Colors.black, // Texto preto
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}