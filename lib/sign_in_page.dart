// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:instagram_clone/authentication_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ).then((value) => _showToast(context, value));
                    },

                    child: const Text("Sign in"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      context.read<AuthenticationService>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                    child: const Text("Sign up"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  void _showToast(BuildContext context, String? message) {
    final scaffold = ScaffoldMessenger.of(context);
    
    if(message == "Given String is empty or null"){
      message = "Please enter email and password";
    }
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message!),  
      ),
    );
  }
}
