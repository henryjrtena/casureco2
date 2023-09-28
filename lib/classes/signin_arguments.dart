import 'package:flutter/material.dart';

class SignInArguments {
  SignInArguments({
    required this.email,
    required this.password,
    required this.onSuccess,
  });

  final String email;
  final String password;
  final VoidCallback onSuccess;
}
