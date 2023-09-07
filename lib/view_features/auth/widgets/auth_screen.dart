// import 'package:flutter/material.dart';
// import 'package:sliding_switch/sliding_switch.dart';

// import '../../custom_widgets/login_widget.dart';
// import '../../custom_widgets/sign_up_widget.dart';

// class AuthScrean extends StatefulWidget {
//   const AuthScrean({super.key});

//   @override
//   State<AuthScrean> createState() => _AuthScreanState();
// }

// class _AuthScreanState extends State<AuthScrean> {
//   bool inLogin = true;
//   late double margin = 0;

//   // double _containerHeight = 100.0; // Initial height

//   // void _toggleContainerHeight() {
//   //   setState(() {
//   //     _containerHeight =
//   //         _containerHeight == 100.0 ? 200.0 : 100.0; // Toggle between heights
//   //   });
//   // }

//   void initState() {
//     super.initState();
//     // initStatecolor = randomColor();
//     // borderRadius = randomBorderRadius();
//     changeMargin();
//   }

//   void changeMargin() {
//     setState(() {
//       margin = inLogin ? 0 : 10;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // backgroundColor: Color(0xff6589FF),
//         resizeToAvoidBottomInset: true,
//         body: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Color(0xff0039F6),
//               Color(0xff6589FF),
//               Color.fromARGB(255, 142, 166, 246),
//             ],
//           )),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 50),
//             child: ListView(shrinkWrap: false, children: [
//               Hero(
//                 tag: "splash",
//                 child: Container(
//                     width: 100,
//                     height: 100,
//                     child:
//                         Image.asset("assets/splash3.jpg-removebg-preview.png")),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.white),
//                 margin: EdgeInsetsDirectional.only(
//                     start: 30, end: 30, top: 60, bottom: margin),
//                 padding: EdgeInsetsDirectional.symmetric(
//                   // horizontal: 10,
//                   vertical: 60,
//                 ),
//                 // alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey
//                               .withOpacity(0.1), // Set the border color to grey
//                           width: 2.0, // Set the border width
//                         ),
//                         borderRadius: BorderRadius.circular(
//                             30.0), // Adjust the border radius as needed
//                       ),
//                       child: SlidingSwitch(
//                         value: false,
//                         width: 270,

//                         onChanged: (bool value) {
//                           // await Future.delayed(
//                           //   const Duration(milliseconds: 400),
//                           // );
//                           inLogin = inLogin!;
//                           changeMargin();

//                           setState(() {
//                             inLogin = !inLogin;
//                             print(inLogin);
//                             changeMargin();
//                           });
//                         },
//                         height: 40,
//                         animationDuration: const Duration(milliseconds: 400),
//                         onTap: () {},
//                         onDoubleTap: () {},
//                         onSwipe: () {},
//                         textOff: "LogIn",
//                         textOn: "SignUp",

//                         // iconOn: Icons.human-male,
//                         contentSize: 17,
//                         colorOn: const Color(0xffFFFFFF),
//                         colorOff: const Color(0xffFFFFFF),
//                         background: const Color(0xffFFFFFF),
//                         buttonColor: const Color(0xff0039F6),
//                         inactiveColor: const Color(0xff0039F6),
//                       ),
//                     ),
//                     // SizedBox(
//                     //               width: 128,
//                     //               height: 128,
//                     //               child: AnimatedContainer(
//                     //                 margin: EdgeInsets.all(margin),
//                     //                 decoration: BoxDecoration(
//                     //                   color: color,
//                     //                   borderRadius: BorderRadius.circular(borderRadius),
//                     //                 ),
//                     //                 duration: _duration,
//                     //               ),
//                     //             ),
//                     AnimatedContainer(
//                         margin: EdgeInsetsDirectional.only(bottom: margin),
//                         duration: Duration(milliseconds: 600),
//                         child: inLogin ? LogInWidget() : SignUpWidget()),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
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
      margin = inLogin ? 0 : 25;
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
            ),
          ],
        ),
      ),
    );
  }
}
