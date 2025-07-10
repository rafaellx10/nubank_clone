import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/findOut/models/card_find_out.dart';

class FindOut extends StatelessWidget {
  const FindOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descubra mais',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16.0),
          _findOutCards(),
        ],
      ),
    );
  }

  _findOutCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardFindOut(
            imagem: 'assets/image/logo-nubank.jpg',
            title: 'Nubank',
            description:
                'Conheça o Nubank e tudo \nque ele pode fazer por você.',
            buttonText: 'Conhecer',
          ),
          const SizedBox(width: 16.0),
          CardFindOut(
            imagem: 'assets/image/indique-amigos.jpg',
            title: 'Indique amigos',
            description: 'Indique amigos e ganhe \nrecompensas exclusivas.',
            buttonText: 'Conhecer',
          ),
        ],
      ),
    );
  }
}
