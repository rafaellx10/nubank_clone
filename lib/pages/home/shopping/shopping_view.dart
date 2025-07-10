import 'package:flutter/material.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _shoppingTitleChevron(),
          SizedBox(height: 16.0),
          Text(
            'Vantagens exclusivas das nossas marcas \n preferidas',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  _shoppingTitleChevron() {
    return Row(
      children: [
        Text(
          'Shopping',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Icon(Icons.chevron_right, color: Colors.grey[600]),
      ],
    );
  }
}
