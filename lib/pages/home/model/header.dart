import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/controllers/controller_home_page.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_profileImage(), _options()],
          ),
          const SizedBox(height: 10.0),
          _welcomeMessage(),
        ],
      ),
    );
  }

  Widget _profileImage() {
    return GestureDetector(
      onTap: () => print('Profile tapped'),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: secondaryPurple,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: _PressableIcon(
          icon: Icon(MdiIcons.accountOutline, color: Colors.white, size: 30.0),
          onPressed: () => print('onPressed: Profile tapped'),
        ),
      ),
    );
  }

  Widget _options() {
    return Row(
      children: [
        GetBuilder<ControllerHomePage>(
          builder: (controllerHomePage) {
            return _PressableIcon(
              icon: Icon(
                controllerHomePage.eyeValue
                    ? MdiIcons.eyeOutline
                    : MdiIcons.eyeOffOutline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () => controllerHomePage.toggleEyeValue(),
            );
          },
        ),
        _PressableIcon(
          icon: Icon(
            MdiIcons.helpCircleOutline,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () => print('Help tapped'),
        ),
        _PressableIcon(
          icon: Icon(
            Icons.person_add_alt_1_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () => print('Settings tapped'),
        ),
      ],
    );
  }

  Widget _welcomeMessage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: const Text(
        'Welcome to Nubank Clone',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _PressableIcon extends StatefulWidget {
  const _PressableIcon({required this.icon, required this.onPressed});

  final Widget icon;
  final VoidCallback onPressed;

  @override
  State<_PressableIcon> createState() => _PressableIconState();
}

class _PressableIconState extends State<_PressableIcon> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.82 : 1,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOutBack,
        child: AnimatedRotation(
          turns: _pressed ? -0.02 : 0,
          duration: const Duration(milliseconds: 140),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
