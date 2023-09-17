import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class My_snackBar extends StatelessWidget {
  const My_snackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void showSnackBar(BuildContext context, String message, Color color) {
    AnimatedSnackBar.material(
      message,
      type: color == Colors.green
          ? AnimatedSnackBarType.success
          : AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     behavior: SnackBarBehavior.floating,
    //     content: Row(
    //       children: [
    //         Icon(
    //           color == Colors.green ? Icons.check_circle : Icons.close,
    //           color: Colors.white,
    //         ),
    //         SizedBox(
    //           width: 20,
    //         ),
    //         Text(
    //           message,
    //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    //         ),
    //       ],
    //     ),
    //     backgroundColor: color,
    //   ),
    // );
  }
}
