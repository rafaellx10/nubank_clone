import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
            children: [Text('teste1'), _profileImage()],
          ),
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
}
