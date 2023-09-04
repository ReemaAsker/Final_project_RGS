import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../../custom_widgets/login_widget.dart';
import '../../custom_widgets/sign_up_widget.dart';

class AuthScrean extends StatefulWidget {
  const AuthScrean({super.key});

  @override
  State<AuthScrean> createState() => _AuthScreanState();
}

class _AuthScreanState extends State<AuthScrean> {
  bool inLogin = true;
  late double margin = 0;

  // double _containerHeight = 100.0; // Initial height

  // void _toggleContainerHeight() {
  //   setState(() {
  //     _containerHeight =
  //         _containerHeight == 100.0 ? 200.0 : 100.0; // Toggle between heights
  //   });
  // }

  void initState() {
    super.initState();
    // initStatecolor = randomColor();
    // borderRadius = randomBorderRadius();
    changeMargin();
  }

  void changeMargin() {
    setState(() {
      margin = inLogin ? 0 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2456FD),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: ListView(shrinkWrap: false, children: [
            Hero(
              tag: "splash",
              child: Container(
                  width: 100,
                  height: 100,
                  child:
                      Image.asset("assets/splash3.jpg-removebg-preview.ico")),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              margin: EdgeInsetsDirectional.only(
                  start: 30, end: 30, top: 60, bottom: margin),
              padding: EdgeInsetsDirectional.symmetric(
                // horizontal: 10,
                vertical: 60,
              ),
              // alignment: Alignment.center,
              child: Column(
                children: [
                  SlidingSwitch(
                    value: false,
                    width: 265,
                    onChanged: (bool value) {
                      // await Future.delayed(
                      //   const Duration(milliseconds: 400),
                      // );
                      inLogin = inLogin!;
                      changeMargin();

                      setState(() {
                        inLogin = !inLogin;
                        print(inLogin);
                        changeMargin();
                      });
                    },
                    height: 32,
                    animationDuration: const Duration(milliseconds: 400),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                    textOff: "LogIn",
                    textOn: "SignUp",

                    // iconOn: Icons.human-male,
                    contentSize: 17,
                    colorOn: const Color(0xffFFFFFF),
                    colorOff: const Color(0xffFFFFFF),
                    background: const Color(0xffFFFFFF),
                    buttonColor: const Color(0xff0039F6),
                    inactiveColor: const Color(0xff0039F6),
                  ),
                  // SizedBox(
                  //               width: 128,
                  //               height: 128,
                  //               child: AnimatedContainer(
                  //                 margin: EdgeInsets.all(margin),
                  //                 decoration: BoxDecoration(
                  //                   color: color,
                  //                   borderRadius: BorderRadius.circular(borderRadius),
                  //                 ),
                  //                 duration: _duration,
                  //               ),
                  //             ),
                  AnimatedContainer(
                      margin: EdgeInsetsDirectional.only(bottom: margin),
                      duration: Duration(milliseconds: 600),
                      child: inLogin ? LogInWidget() : SignUpWidget()),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
