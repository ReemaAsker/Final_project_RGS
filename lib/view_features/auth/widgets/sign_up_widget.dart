import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gsg_final_project_rgs/view_features/auth/widgets/auth_screen.dart';

import '../../../cores/helpers/api_response.dart';
import '../../../custom_widgets/custom_snackbar.dart';
import '../controller/authController.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  Map<String, String> getBody() {
    late final body;
    if (_formKey.currentState!.validate()) {
      if (passwordController.text == confirmpasswordController.text) {
        body = {
          'email': emailController.text,
          'password': passwordController.text,
          'password_confirmation': confirmpasswordController.text,
          'name': usernameController.text
        };
      } else {
        My_snackBar.showSnackBar(
            context, "password not equal confirmpassword", Colors.red);
      }
    }
    return body;
  }

  void submit(ApiResponse value) async {
    if (value.status == Status.COMPLETED) {
      if (mounted) {
        My_snackBar.showSnackBar(
            context, "Sign up process ,Sucuuess , login now ..", Colors.green);
        // Navigator.pushNamed(context, Hello.id),
        await Future.delayed(
          const Duration(seconds: 2),
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ));
      }
    } else {
      var error_words = value.message!.split(" ");
      My_snackBar.showSnackBar(context,
          error_words[0] + error_words[1].replaceAll(":", "...."), Colors.red);
    }
  }

  void signup() {
    AuthController().signup(getBody()).then((value) => {submit(value)});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the username';
                } else if (value.length < 3) {
                  return "username must be more than 2 character";
                }
                return null;
              },
              autofillHints: const [AutofillHints.email],
              decoration: InputDecoration(
                hintText: "Enter user name ",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the email';
                } else if (!EmailValidator.validate(value)) {
                  return 'please enter a valid email';
                }
                return null;
              },
              autofillHints: const [AutofillHints.email],
              decoration: InputDecoration(
                hintText: "Enter email ",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the password';
                } else if (value.length < 6) {
                  return 'Password must be more than 5 characters';
                }
                return null;
              },
              autofillHints: const [AutofillHints.password],
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                hintText: "password",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: confirmpasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the password';
                } else if (value.length < 6) {
                  return 'Password must be more than 5 characters';
                }
                return null;
              },
              autofillHints: const [AutofillHints.password],
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: _toggleConfirmPasswordVisibility,
                  child: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                hintText: "confirm password",
                hintStyle: TextStyle(
                  color: Color(0xffBFBFBF),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff0039F6),
                    Color(0xff6589FF),
                  ],
                ),
              ),
              child: GestureDetector(
                onTap: () => signup(),
                child: Container(
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
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
