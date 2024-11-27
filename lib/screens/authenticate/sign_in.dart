import 'package:flutter/material.dart';
import 'package:flutter_application_babs/service/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 163, 176),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text("Please sign in to barbs"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
              onPressed: () async {
                dynamic result = await _authService.signInAnonymously();
              },
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.black),
              ))),
    );
  }
}
