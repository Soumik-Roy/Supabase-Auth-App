import 'package:flutter/material.dart';
import 'package:supabase_auth/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _redirectCalled = false;
  final supabaseClient = Supabase.instance.client;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabaseClient.auth.currentSession;
    debugPrint(session?.toJson().toString());
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.person_4, color: Colors.black, size: 80,),
            CircularProgressIndicator(color: Colors.orange,),
          ],
        ),
      ),
    );
  }
}