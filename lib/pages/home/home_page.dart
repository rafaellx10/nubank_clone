import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
import 'package:nubank_clone/pages/home/account/account.dart';
import 'package:nubank_clone/pages/home/actions/menu_itens.dart';
import 'package:nubank_clone/pages/home/creditCard/credit_card.dart';
import 'package:nubank_clone/pages/home/creditCard/my_credit_card.dart';
import 'package:nubank_clone/pages/home/findOut/find_out.dart';
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
  late final ControllerHomePage _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(ControllerHomePage());
  }

  Future<void> _onRefresh() async {
    await _controller.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[
      const Header(),
      const AccountNubank(),
      const MenuItens(),
      const Divider(thickness: 1.2),
      const MyCreditCard(),
      const Divider(thickness: 1.2),
      const Notifications(),
      const Divider(thickness: 1.2),
      const CreditCard(),
      const Divider(thickness: 1.2),
      const Investments(),
      const Divider(thickness: 1.2),
      const SecurityLife(),
      const Divider(thickness: 1.2),
      const ShoppingView(),
      const Divider(thickness: 1.2),
      const FindOut(),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: ColoredBox(
        color: backgroundColor,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          displacement: 32,
          strokeWidth: 3,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  sections.length,
                  (index) => _AnimatedHomeSection(
                    index: index,
                    child: sections[index],
                  ),
                ),
              ),
            ),
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

class _AnimatedHomeSection extends StatefulWidget {
  const _AnimatedHomeSection({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_AnimatedHomeSection> createState() => _AnimatedHomeSectionState();
}

class _AnimatedHomeSectionState extends State<_AnimatedHomeSection> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    final delay = Duration(milliseconds: 70 * widget.index);
    Future<void>.delayed(delay, () {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    final visible = reduceMotion ? true : _visible;

    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 0.15),
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeOutBack,
        child: widget.child,
      ),
    );
  }
}
