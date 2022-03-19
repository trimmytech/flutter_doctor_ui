

import 'package:flutter/material.dart';
import 'package:flutter_docker/constants.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Svg('assets/svg/icon-burger.svg', size: Size(24,24))
            )
          ),

        ),
        CircleAvatar(
          backgroundColor: kBlueColor,
          backgroundImage: AssetImage("assets/images/avatar.png"),
        )

      ],
    );
  }
}
