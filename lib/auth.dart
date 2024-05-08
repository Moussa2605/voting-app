import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String? login;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    final String url = 'http://localhost:3000/login/$username/$password';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
          log('Login successful');
          Navigator.pushNamed(context, '/home');
      } else {
        throw Exception('Server error with status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Failed to login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login: $e'))
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70,),
                  Image.asset("assets/images/2.png", height: 250, width: 250),
                  SizedBox(height: 50,),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 20),
                  _isLoading ? CircularProgressIndicator() : Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
