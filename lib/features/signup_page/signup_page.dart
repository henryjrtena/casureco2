import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:casureco/widgets/button.dart';
import 'package:casureco/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    required this.onFirebaseSignUp,
    Key? key,
  }) : super(key: key);

  final Function(String, String) onFirebaseSignUp;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        email.length < minChars ||
        password.length < minChars) return;

    // Passed Validations
    widget.onFirebaseSignUp.call(
      email,
      password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/casureco.png',
                  scale: 2,
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign-up',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: blue),
                  ),
                ),
                const SizedBox(height: 25),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => context.go(SignInPageConnector.route),
                        child: Text(
                          'Have an account?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                AppButton(
                  onTap: _signUp,
                  label: 'Continue',
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
