import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              // style: TextStyle(height: 20),
              decoration: InputDecoration(
                hintText: "Enter email or username",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),

            TextFormField(
              // style: TextStyle(height: 20),
              decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            TextFormField(
              // style: TextStyle(height: 20),
              decoration: InputDecoration(
                hintText: "confirm password",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(double.infinity, 50),
                primary: Color(0xff0039F6),
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 103, vertical: 14),
              ),
              child: SizedBox(
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              onPressed: () {
                print("sign up button pressed");
              },
            )
            // ElevatedButton(
            //   style: const ButtonStyle(backgroundColor: Color(0xff)),
            //   child: Text("Log In"),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }
}
