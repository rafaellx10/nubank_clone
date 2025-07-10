import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_clone/pages/home/account/account.dart';
import 'package:nubank_clone/pages/home/actions/menu_itens.dart';
import 'package:nubank_clone/pages/home/creditCard/credit_card.dart';
import 'package:nubank_clone/pages/home/creditCard/my_credit_card.dart';
import 'package:nubank_clone/pages/home/findOut/finfOut.dart';
import 'package:nubank_clone/pages/home/investments/investments.dart';
import 'package:nubank_clone/pages/home/model/header.dart';
import 'package:nubank_clone/pages/home/notification/notification.dart';
import 'package:nubank_clone/pages/home/securiy/security.dart';
import 'package:nubank_clone/pages/home/shopping/shopping_view.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Header(),
              AccountNubank(),
              MenuItens(),
              Divider(thickness: 1.2),
              MyCreditCard(),
              Divider(thickness: 1.2),
              Notifications(),
              Divider(thickness: 1.2),
              CreditCard(),
              Divider(thickness: 1.2),
              Investments(),
              Divider(thickness: 1.2),
              SecurityLife(),
              Divider(thickness: 1.2),
              ShoppingView(),
              Divider(thickness: 1.2),
              FindOut(),
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
