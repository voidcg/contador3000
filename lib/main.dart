import 'package:flutter/material.dart';

// Função principal que inicia o app
void main() {
  runApp(const Contador3000App());
}

// Widget principal do app
class Contador3000App extends StatelessWidget {
  const Contador3000App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner "debug" do canto
      home: HomeScreen(), // Define a tela inicial
    );
  }
}

// Tela inicial com estado (para mudar tema e contador)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int vontade = 0; // Contador de vontade de jogar
  bool isDarkMode = true; // Define se o app está no modo escuro

  // Aumenta o contador
  void aumentarVontade() {
    setState(() {
      vontade++;
    });
  }

  // Zera o contador
  void zerarVontade() {
    setState(() {
      vontade = 0;
    });
  }

  // Alterna entre modo claro e escuro
  void alternarTema() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Cores de fundo e texto dependendo do tema atual
    final backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final zerarButtonColor = isDarkMode ? Colors.white : Colors.black;
    final zerarTextColor = isDarkMode ? Colors.black : Colors.white;
    final emoji = isDarkMode ? '🌙' : '☀️'; // Emoji que aparece no botão de alternar

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Botão de alternância (modo claro/escuro) no canto superior esquerdo
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Text(
                  emoji,
                  style: const TextStyle(fontSize: 28),
                ),
                onPressed: alternarTema,
              ),
            ),
            // Conteúdo principal centralizado
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🎮', // Emoji central do controle
                    style: TextStyle(fontSize: 60),
                  ),
                  const SizedBox(height: 16),
                  // Texto de instrução
                  Text(
                    'Toque no botão para aumentar a sua vontade de jogar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Botão para aumentar o contador
                  ElevatedButton(
                    onPressed: aumentarVontade,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Botão',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Texto que mostra o valor atual do contador
                  Text(
                    'Você está com $vontade x de vontade de jogar',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Botão de zerar na parte inferior central da tela
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: zerarVontade,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: zerarButtonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Zerar',
                    style: TextStyle(
                      color: zerarTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
