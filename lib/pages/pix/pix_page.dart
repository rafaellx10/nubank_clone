import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/pages/pix/charge/pix_charge_page.dart';
import 'package:nubank_clone/pages/pix/keys/pix_keys_page.dart';
import 'package:nubank_clone/pages/pix/limits/pix_limits_page.dart';
import 'package:nubank_clone/pages/pix/pay/pix_pay_page.dart';
import 'package:nubank_clone/pages/pix/statement/pix_statement_page.dart';
import 'package:nubank_clone/pages/pix/transfer/pix_transfer_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class PixPage extends StatelessWidget {
  const PixPage({super.key});

  ControllerHomePage get _controller {
    if (Get.isRegistered<ControllerHomePage>()) {
      return Get.find<ControllerHomePage>();
    }
    return Get.put(ControllerHomePage());
  }

  @override
  Widget build(BuildContext context) {
    final actions = <_PixActionItem>[
      _PixActionItem(
        title: 'Transferir',
        icon: MdiIcons.send,
        pageBuilder: () => const PixTransferPage(),
      ),
      _PixActionItem(
        title: 'Pagar',
        icon: MdiIcons.barcode,
        pageBuilder: () => const PixPayPage(),
      ),
      _PixActionItem(
        title: 'Cobrar',
        icon: MdiIcons.cashPlus,
        pageBuilder: () => const PixChargePage(),
      ),
      _PixActionItem(
        title: 'Minhas chaves',
        icon: MdiIcons.keyVariant,
        pageBuilder: () => const PixKeysPage(),
      ),
      _PixActionItem(
        title: 'Extrato Pix',
        icon: MdiIcons.fileDocumentOutline,
        pageBuilder: () => const PixStatementPage(),
      ),
      _PixActionItem(
        title: 'Meus limites',
        icon: MdiIcons.shieldHalfFull,
        pageBuilder: () => const PixLimitsPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Área Pix'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [backgroundColor, secondaryPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GetBuilder<ControllerHomePage>(
              init: _controller,
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Saldo disponível',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.eyeValue ? controller.saldo : 'R\$ ••••••••',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tudo para pagar, transferir e receber em segundos.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ações Pix',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            itemCount: actions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) {
              final action = actions[index];
              return _PixActionCard(
                title: action.title,
                icon: action.icon,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => action.pageBuilder()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PixActionItem {
  _PixActionItem({
    required this.title,
    required this.icon,
    required this.pageBuilder,
  });

  final String title;
  final IconData icon;
  final Widget Function() pageBuilder;
}

class _PixActionCard extends StatefulWidget {
  const _PixActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_PixActionCard> createState() => _PixActionCardState();
}

class _PixActionCardState extends State<_PixActionCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _pressed ? backgroundColor : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, size: 26, color: Colors.black87),
              const Spacer(),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
