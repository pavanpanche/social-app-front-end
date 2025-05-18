import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Perform register logic here
      print('Registering $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => email = val,
                validator: (val) =>
                    val != null && val.contains('@') ? null : 'Invalid email',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (val) => password = val,
                validator: (val) =>
                    val != null && val.length >= 6 ? null : 'Password too short',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (val) => confirmPassword = val,
                validator: (val) => val == password ? null : 'Passwords do not match',
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text('Register')),
              TextButton(
                onPressed: () {
                  // Navigate back to login screen
                  Navigator.pop(context);
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
