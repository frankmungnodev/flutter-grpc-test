import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    required this.label,
    required this.chatListPath,
    super.key,
  });

  final String label;
  final String chatListPath;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final txtUserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            TextFormField(
              controller: txtUserNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter username to continue',
              ),
            ),

            //
            TextButton(
              onPressed: () {
                if (txtUserNameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter username'),
                    ),
                  );
                } else {
                  context.goNamed(
                    widget.chatListPath,
                    extra: txtUserNameController.text.trim(),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
