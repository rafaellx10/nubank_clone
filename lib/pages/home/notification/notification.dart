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
          _AnimatedNoticeCard(
            'Seu ',
            'Informe de rendimentos',
            ' de 2025 já está disponível.',
          ),
          _AnimatedNoticeCard(
            'Seu ',
            'dividendo das ações',
            ' já está disponível.',
          ),
          _AnimatedNoticeCard(
            'Seu ',
            'extrato de cartão',
            ' já está disponível.',
          ),
        ],
      ),
    );
  }
}

class _AnimatedNoticeCard extends StatefulWidget {
  const _AnimatedNoticeCard(this.firstText, this.highlightText, this.lastText);

  final String firstText;
  final String highlightText;
  final String lastText;

  @override
  State<_AnimatedNoticeCard> createState() => _AnimatedNoticeCardState();
}

class _AnimatedNoticeCardState extends State<_AnimatedNoticeCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: () => print('Notification tapped: ${widget.highlightText}'),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: const Duration(milliseconds: 140),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          padding: const EdgeInsets.all(24.0),
          constraints: const BoxConstraints(maxWidth: 300.0),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: _pressed ? Colors.deepPurple : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14.0, color: Colors.black),
              children: [
                TextSpan(text: widget.firstText),
                TextSpan(
                  text: widget.highlightText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                TextSpan(text: widget.lastText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
