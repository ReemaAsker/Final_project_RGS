import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/auth/widgets/testUi.dart';

import '../auth/widgets/auth_screen.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    loading();
  }

  void loading() async {
    bool? check = await checkInSharedPref();
    if (check!) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Hello();
            },
          ),
        );
      }
    } else {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AuthScreen();
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff0039F6),
            Color(0xff6589FF),
          ],
        )),
        child: Center(
          child: Hero(
            tag: "splash",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.3, // Adjust the scale factor as needed
                  child: Image.asset("assets/logoone2.png"),
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            ),
            // child: Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('utils/assets/splash.png'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   // constraints: const BoxConstraints.expand(),
            // ),
          ),
        ),
      ),
    );
  }
}
