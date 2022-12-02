import 'package:flutter/material.dart';
import 'package:supabase_auth/Utils/supabase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _supabaseClient = SupabaseManager();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text("Home Page"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout',}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: SizedBox(
            height: double.infinity,
            child: Center(
              child: Text(
                "Hello\n${_supabaseClient.client.auth.currentUser?.email}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )
        )

    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        _supabaseClient.logout(context);
        break;

    }
  }
}
