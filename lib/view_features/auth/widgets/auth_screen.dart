import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

import 'login_widget.dart';
import 'sign_up_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  late double margin = 0;

  @override
  void initState() {
    super.initState();
    changeMargin();
  }

  void changeMargin() {
    setState(() {
      margin = inLogin ? 0 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 270.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff0039F6),
                    Color(0xff6589FF),
                    Color(0xff6589FF),
                  ],
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70.0),
                  bottomRight: Radius.circular(80.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Center(
                  child: Hero(
                    tag: "splash",
                    child: Container(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                            "assets/splash3.jpg-removebg-preview.png")),
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xff6589FF).withOpacity(0.1),
            ),
            Positioned(
              top: 190.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey
                              .withOpacity(0.1), // Set the border color to grey
                          width: 2.0, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the border radius as needed
                      ),
                      child: SlidingSwitch(
                        value: false,
                        width: 270,

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
                        height: 40,
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
                    ),
                    AnimatedContainer(
                        margin: EdgeInsetsDirectional.only(bottom: margin),
                        duration: Duration(milliseconds: 600),
                        child: inLogin ? LogInWidget() : SignUpWidget()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
