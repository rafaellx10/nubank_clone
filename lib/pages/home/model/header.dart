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

  _profileImage() {
    return GestureDetector(
      onTap: () => print('Profile tapped'),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: secondaryPurple,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: IconButton(
          icon: Icon(MdiIcons.accountOutline, color: Colors.white, size: 30.0),
          onPressed: () => print('onPressed: Profile tapped'),
        ),
      ),
    );
  }

  _options() {
    return Row(
      children: [
        GetBuilder<ControllerHomePage>(
          init: ControllerHomePage(),
          builder: (controllerHomePage) {
            return IconButton(
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
        IconButton(
          icon: Icon(
            MdiIcons.helpCircleOutline,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () => print('Help tapped'),
        ),
        IconButton(
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

  _welcomeMessage() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Text(
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
