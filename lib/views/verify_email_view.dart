
import 'package:flutter/material.dart';
import 'package:notesy/constants/routes.dart';
import 'package:notesy/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
          children: [
            const Text(
              "We've sent you an email verification, please open it to verify your account."),
           const Text(
            "If you have not received a verification email, please tap the button below."),
           TextButton(
            onPressed: () async {
             await AuthService.firebase().sendEmailVerification();
           }, 
           child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async {
             await AuthService.firebase().logOut();
             Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute, 
             (route) => false
            );
          }, 
          child: const Text('Restart'),
          )
         ],
      ),
    );
  }
}