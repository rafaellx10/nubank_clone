import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [_income(), _income(), _income(), _income(), _income()],
      ),
    );
  }

  _income() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: const EdgeInsets.all(24.0),
      constraints: BoxConstraints(
        // Exemplo: Largura máxima de 600 pixels
        maxWidth: 300.0,
        // Se quiser uma altura máxima também:
        // maxHeight: 200.0,
      ),

      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(16.0),
      ),

      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14.0, color: Colors.black),
          children: [
            const TextSpan(text: 'Seu  '),
            TextSpan(
              text: 'Informe de Rendimentos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const TextSpan(text: ' de 2025 já está disponível.'),
          ],
        ),
      ),
    );
  }
}
