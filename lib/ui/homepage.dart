

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: 24,
                        height: 24,
                        image: Svg('assets/svg/icon-burger.svg'),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

              ],
            ),
        )
    );
  }
}
