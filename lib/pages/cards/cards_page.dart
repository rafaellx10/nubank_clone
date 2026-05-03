import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/pages/cards/installments/cards_installments_page.dart';
import 'package:nubank_clone/pages/cards/limit/cards_limit_page.dart';
import 'package:nubank_clone/pages/cards/pay/cards_pay_invoice_page.dart';
import 'package:nubank_clone/pages/cards/security/cards_security_page.dart';
import 'package:nubank_clone/pages/cards/settings/cards_settings_page.dart';
import 'package:nubank_clone/pages/cards/virtual/cards_virtual_card_page.dart';
import 'package:nubank_clone/utils/colors_standarts.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Cartões'),
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<ControllerHomePage>(
        builder: (controller) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _summaryCard(controller),
              const SizedBox(height: 14),
              _statusRow(controller),
              const SizedBox(height: 18),
              const Text(
                'Atalhos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.35,
                children: [
                  _cardShortcut(context, 'Pagar fatura', MdiIcons.cashCheck, const CardsPayInvoicePage()),
                  _cardShortcut(context, 'Parcelar compras', MdiIcons.creditCardClockOutline, const CardsInstallmentsPage()),
                  _cardShortcut(context, 'Ajustar limite', MdiIcons.chartLine, const CardsLimitPage()),
                  _cardShortcut(context, 'Cartão virtual', MdiIcons.cellphoneNfc, const CardsVirtualCardPage()),
                  _cardShortcut(context, 'Bloquear cartão', MdiIcons.lockOutline, const CardsSecurityPage()),
                  _cardShortcut(context, 'Configurações', MdiIcons.cogOutline, const CardsSettingsPage()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _summaryCard(ControllerHomePage controller) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [backgroundColor, secondaryPurple]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Fatura atual', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          Text(
            controller.eyeValue ? controller.creditCard : 'R\$ ••••••••',
            style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            controller.eyeValue ? 'Limite disponível: ${controller.limitCard}' : 'Limite disponível: R\$ ••••••••',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Vencimento em ${controller.invoiceDueInDays} dias',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _statusRow(ControllerHomePage controller) {
    return Row(
      children: [
        Expanded(
          child: _statusBox(
            'Cartão físico',
            controller.isPhysicalCardBlocked ? 'Bloqueado' : 'Ativo',
            controller.isPhysicalCardBlocked ? Colors.red : Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statusBox(
            'Cartão virtual',
            controller.isVirtualCardEnabled ? 'Ativo' : 'Inativo',
            controller.isVirtualCardEnabled ? Colors.green : Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _statusBox(String title, String status, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _cardShortcut(BuildContext context, String label, IconData icon, Widget page) {
    return _PressableShortcut(
      label: label,
      icon: icon,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}

class _PressableShortcut extends StatefulWidget {
  const _PressableShortcut({required this.label, required this.icon, required this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_PressableShortcut> createState() => _PressableShortcutState();
}

class _PressableShortcutState extends State<_PressableShortcut> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: const Duration(milliseconds: 140),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _pressed ? backgroundColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon),
              const Spacer(),
              Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
