import 'package:flutter/material.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 65),
        child: SizedBox(
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
              // SizedBox(
              //   height: 20,
              // ),
              TextFormField(
                // style: TextStyle(height: 20),
                decoration: InputDecoration(
                  hintText: "password",
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
                child: Text(
                  "LogIn",
                  style: TextStyle(fontSize: 12),
                ),
                onPressed: () {
                  print("login button pressed");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
