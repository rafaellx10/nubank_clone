import 'package:flutter/material.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(children: [Text("Data")]),
    );
  }
}
