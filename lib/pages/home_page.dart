// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:nubank_clone/theme_colors.dart';
import 'package:nubank_clone/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta as mudanças no ThemeProvider.
    // context.watch<T>() faz com que o widget reconstrua quando notifyListeners() é chamado.
    final themeProvider = context.watch<ThemeProvider>();

    // Define a duração da animação, igual ao seu withTiming.
    const animationDuration = Duration(milliseconds: 800);

    // AnimatedContainer faz a mágica da transição de cor do background.
    return AnimatedContainer(
      duration: animationDuration,
      color:
          themeProvider.isDark
              ? ThemeColors.Dark.background
              : ThemeColors.Light.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedDefaultTextStyle faz a transição de cor de todos os textos filhos.
            AnimatedDefaultTextStyle(
              duration: animationDuration,
              style: TextStyle(
                color:
                    themeProvider.isDark
                        ? ThemeColors.Dark.text
                        : ThemeColors.Light.text,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                'Bem-vindo ao meu aplicativo!',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // context.read<T>() obtém o provider sem escutar por mudanças.
              // Ideal para ser usado dentro de callbacks como o onPressed.
              onPressed: () => context.read<ThemeProvider>().toggleTheme(),
              style: ElevatedButton.styleFrom(
                // O próprio botão também pode ter suas cores animadas.
                // A reconstrução do widget com novas cores já cria um efeito suave.
                backgroundColor:
                    themeProvider.isDark
                        ? ThemeColors.Dark.flashyButton
                        : ThemeColors.Light.flashyButton,
                foregroundColor:
                    themeProvider.isDark
                        ? ThemeColors.Dark.textFlashyButton
                        : ThemeColors.Light.textFlashyButton,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                animationDuration:
                    animationDuration, // Anima a mudança de cor do botão
              ),
              child: Text(
                'Trocar para tema ${themeProvider.isDark ? "claro" : "escuro"}!',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
