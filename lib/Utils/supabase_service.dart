import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants.dart';

final SupabaseCredentials credentials = SupabaseCredentials();

class SupabaseManager {
  final client = Supabase.instance.client;


  Future<void> signUpUser(context, {required String email,required String password, required String name}) async {
    debugPrint("email:$email password:$password");
    Map<String, String> data = {
      'email' : email,
      'full_name' : name,
      'updated_at': DateTime.now().toIso8601String(),
    };

    try{
      final result = await client.auth.signUp(email: email, password: password, data: data);
      // debugPrint(result.user?.toJson().toString());

      if (result.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Registration Successful',
          ),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacementNamed(context, '/login');
      }
      else {
        debugPrint('error while signup');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Registration Error',
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
    on AuthException catch(error){
      debugPrint(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.message,
        ),
        backgroundColor: Colors.red,
      ));
    }

  }

  Future<void> logInUser(context, {required String email,required String password}) async {
    debugPrint("email:$email password:$password");
    try {
      final result = await client.auth.signInWithPassword(email: email, password: password);
      // debugPrint(result.user?.toJson().toString());

      if (result.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Login Successful',
          ),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacementNamed(context, '/home');
      }
      else {
        debugPrint('error while login');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Login Error',
            style: TextStyle(backgroundColor: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
    on AuthException catch(error){
      debugPrint('error while login');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.message,
        ),
        backgroundColor: Colors.red,
      ));
    }

  }


  Future<void> logout (context)async{
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }
}