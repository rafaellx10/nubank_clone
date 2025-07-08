import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _itemNotification(
            'Seu ',
            'Informe de rendimentos',
            ' de 2025 já está disponível.',
          ),
          _itemNotification(
            'Seu ',
            'dividendo das ações',
            ' já está disponível.',
          ),
          _itemNotification(
            'Seu ',
            'extrato de cartão',
            ' já está disponível.',
          ),
        ],
      ),
    );
  }

  _itemNotification(String firstText, String highlightText, String lastText) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: const EdgeInsets.all(24.0),
      constraints: const BoxConstraints(maxWidth: 300.0),

      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(16.0),
      ),

      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14.0, color: Colors.black),
          children: [
            TextSpan(text: firstText),
            TextSpan(
              text: highlightText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            TextSpan(text: lastText),
          ],
        ),
      ),
    );
  }
}
