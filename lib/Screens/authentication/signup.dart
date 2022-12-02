import 'package:flutter/material.dart';
import 'package:supabase_auth/Utils/supabase_service.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _supabaseClient = SupabaseManager();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up Page"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: 'Enter your name'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter a valid email'),
                  validator: (String? value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Email is not valid';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (String? value) {
                    if (value==null  || value.isEmpty) {
                      return 'Invalid password';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _supabaseClient.signUpUser(context,
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _usernameController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));

                  },
                  child: const Text('Already a User? Login'))
            ],
          ),
        ),
      ),
    );
  }
}

