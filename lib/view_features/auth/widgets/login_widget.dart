import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:gsg_final_project_rgs/cores/helpers/api_response.dart';
import 'package:gsg_final_project_rgs/custom_widgets/custom_snackbar.dart';
import 'package:gsg_final_project_rgs/view_features/auth/controller/authController.dart';
import 'package:gsg_final_project_rgs/view_features/auth/widgets/testUi.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Map<String, String> getBody() {
    late final body;
    body = {'email': emailController.text, 'password': passwordController.text};

    return body;
  }

  void submit(ApiResponse value) {
    if (value.status == Status.ERROR) {
      My_snackBar.showSnackBar(context,
          value.message!.split(" ")[0].replaceAll(":", "...."), Colors.red);
    } else {
      if (mounted) {
        My_snackBar.showSnackBar(context, "Welcome", Colors.green);
        // Navigator.pushNamed(context, Hello.id),
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Hello(),
            ));
      }
    }
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      AuthController().login(getBody()).then((value) => {submit(value)});
    } else {
      My_snackBar.showSnackBar(
          context, "please , Complete entering  .. ", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 65),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                autofillHints: const [AutofillHints.email],
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(
                    color: Color(0xffBFBFBF),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the email';
                  } else if (!EmailValidator.validate(value)) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                autofillHints: const [AutofillHints.password],
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Color(0xffBFBFBF),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the password';
                  } else if (value.length < 6) {
                    return 'Password must be more than 5 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () => login(),
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff0039F6),
                        Color(0xff6589FF),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // }),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     maximumSize: Size(double.infinity, 50),
              //     primary: Color(0xff0039F6),
              //     padding: EdgeInsetsDirectional.symmetric(
              //         horizontal: 103, vertical: 14),
              //   ),
              //   child: Text(
              //     "LogIn",
              //     style: TextStyle(fontSize: 12),
              //   ),
              //   onPressed: () {
              //     print("login button pressed");
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
