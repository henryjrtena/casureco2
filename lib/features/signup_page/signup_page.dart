import 'package:casureco/features/signin_page/signin_page_connector.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.power,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome to Casureco2 Mobile App',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
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
                  onTap: () async => await widget.onFirebaseSignUp.call(emailController.text, passwordController.text),
                  label: 'Create an account',
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
