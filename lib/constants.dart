import 'package:flutter/material.dart';

class SupabaseCredentials{
  String projectPassword = "Ctfq7begjKYPuZuu";
  String projectURL = "https://nmvhcnfqznxkrsfreboj.supabase.co";
  String anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tdmhjbmZxem54a3JzZnJlYm9qIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk5Njg4MzMsImV4cCI6MTk4NTU0NDgzM30.8EFwb6QEh8SqvMKl1zrzpyuKet6u4hQNZ0e2MUkZlEE";
  String serviceRoleKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tdmhjbmZxem54a3JzZnJlYm9qIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY2OTk2ODgzMywiZXhwIjoxOTg1NTQ0ODMzfQ.uj459_3Zlkn35E1JnZcTgj0jZX13CrSpss9H5u8fBIE";
}

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.black54,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(backgroundColor: Colors.white),
      ),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
