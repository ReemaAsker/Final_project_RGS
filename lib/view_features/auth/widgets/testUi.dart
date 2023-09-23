import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/cores/helpers/token_helper.dart';
import 'package:gsg_final_project_rgs/custom_widgets/custom_snackbar.dart';
import 'package:gsg_final_project_rgs/view_features/auth/widgets/auth_screen.dart';
import 'package:gsg_final_project_rgs/view_features/auth/controller/authController.dart';

class Hello extends StatefulWidget {
  static String id = '/hello';

  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  void logout() {
    if (removeUser()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthScreen(),
          ));
    } else {
      My_snackBar.showSnackBar(context, "can't logout", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello ${getToken().toString()}"),
          ElevatedButton(
              onPressed: () => logout(), child: const Text("logout")),
        ],
      ),
    ));
  }
}
