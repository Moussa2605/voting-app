import 'dart:developer';

import 'package:flutter/material.dart';


class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 
  String username = _usernameController.text;
  String password = _passwordController.text;

 Future<void> loginUser() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/login/$username/$password'));
      if (response.statusCode == 200) {
        List<dynamic> fetchedCandidates = json.decode(response.body);

        return fetchCandidates;
      } else {
        throw Exception('Failed to load candidates');
      }
    } catch (e) {
      print('Error fetching candidates: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                Image.asset("assets/images/2.png",height: 250,width: 250,


                ),
                SizedBox(height: 50,),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,  // Ajoute un fond au champ de texte
                    fillColor: Colors.white.withOpacity(0.7),  // Fond blanc avec opacité
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
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (){
                      final user = loginUser();
                      Navigator.push(context, '/home')
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
