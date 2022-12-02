import 'package:flutter/material.dart';
import 'package:supabase_auth/Screens/authentication/login.dart';
import 'package:supabase_auth/Screens/authentication/signup.dart';
import 'package:supabase_auth/Screens/homepage.dart';
import 'package:supabase_auth/Screens/startup/splash_screen.dart';
import 'package:supabase_auth/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final credentials = SupabaseCredentials();

  await Supabase.initialize(
    url: credentials.projectURL,
    anonKey: credentials.anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Demo Auth App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (_) => const SplashScreen(),
        '/signup': (_) => const SignupScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SplashScreen(),
    );
  }
}