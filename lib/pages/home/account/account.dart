import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';

class AccountNubank extends StatefulWidget {
  const AccountNubank({super.key});

  @override
  State<AccountNubank> createState() => _AccountNubankState();
}

class _AccountNubankState extends State<AccountNubank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_accountChevron(), _moneyAccount()],
      ),
    );
  }

  _accountChevron() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Conta',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.chevron_right, color: Colors.grey[600]),
      ],
    );
  }

  _moneyAccount() {
    return GetBuilder<ControllerHomePage>(
      builder: (controller) {
        final value = controller.eyeValue ? controller.saldo : 'R\$ ••••••••';

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 320),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.08, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Text(
            value,
            key: ValueKey<String>(value),
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        );
      },
    );
  }
}
