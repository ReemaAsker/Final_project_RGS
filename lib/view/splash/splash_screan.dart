import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    splashDelay();
  }

  // void splashDelay() async {
  //   bool skipLogin = false;
  //   final prefs = await SharedPreferences.getInstance();
  //   final bool? saveUser = prefs.getBool('saveUser');
  //   if (saveUser != null) {
  //     skipLogin = saveUser;
  //   }
  //   await Future.delayed(
  //     const Duration(seconds: 3),
  //   );
  //
  //   if (skipLogin) {
  //     Navigator.pushNamed(
  //       context,
  //       '/congrats',
  //     );
  //   } else {
  //     Navigator.pushNamed(
  //       context,
  //       '/login',
  //     );
  //   }
  // }

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
            Colors.blue,
          ],
        )),
        child: Hero(
          tag: "splash",
          child: Image.asset("assets/splash3.jpg-removebg-preview.ico"),
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
    );
  }

  void splashDelay() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AuthScrean();
        },
      ),
    );
  }
}

// image: AssetImage(
// "utils/assets/splash.jpg",
// ),
