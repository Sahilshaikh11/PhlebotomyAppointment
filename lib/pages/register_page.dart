import 'package:ams/button.dart';
import 'package:ams/colors.dart';
import 'package:ams/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (constext) => const Center(
              child: CircularProgressIndicator(),
            ));
    if (passwordTextController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessage("Password doesn't match");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // logo
              const Icon(
                Icons.lock,
                color: AppColors.accentColor,
                size: 100,
              ),

              const SizedBox(
                height: 50,
              ),
              Text(
                "Create an account.",
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 25,
              ),

              MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                  controller: passwordTextController,
                  hintText: "Password",
                  obscureText: true),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true),

              const SizedBox(
                height: 10,
              ),

              MyButton(onTap: signUp, text: 'Sign Up'),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColor),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
