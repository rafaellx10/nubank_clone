import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_clone/pages/account/account.dart';
import 'package:nubank_clone/pages/actions/menu_itens.dart';
import 'package:nubank_clone/pages/creditCard/my_credit_card.dart';
import 'package:nubank_clone/pages/home/model/header.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: const [
              Header(),
              AccountNubank(),
              MenuItens(),
              Divider(thickness: 1.2),
              MyCreditCard(),
              Divider(thickness: 1.2),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0.0),
      child: AppBar(
        backgroundColor: backgroundColor,
        // title: const Text(
        //   'Nubank Clone',
        //   style: TextStyle(color: Colors.white),
        // ),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
