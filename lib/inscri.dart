import 'package:flutter/material.dart';

class Inscri extends StatefulWidget {
  const Inscri({super.key});

  @override
  State<Inscri> createState() => _InscriState();
}

class _InscriState extends State<Inscri> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                Image.asset("assets/images/2.png",height: 250,width: 250,


                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    filled: true,  // Ajoute un fond au champ de texte
                    fillColor: Colors.white.withOpacity(0.7),  // Fond blanc avec opacité
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Prenom',
                    filled: true,  // Ajoute un fond au champ de texte
                    fillColor: Colors.white.withOpacity(0.7),  // Fond blanc avec opacité
                  ),
                ),
                SizedBox(height: 5,),

                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'CNI',
                    filled: true,  // Ajoute un fond au champ de texte
                    fillColor: Colors.white.withOpacity(0.7),  // Fond blanc avec opacité
                  ),
                ),
                SizedBox(height: 5,),


                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'login',
                    filled: true,  // Ajoute un fond au champ de texte
                    fillColor: Colors.white.withOpacity(0.7),  // Fond blanc avec opacité
                  ),
                ),
                SizedBox(height: 5,),



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
                    onPressed: () {

                    },
                    child: Text("S'inscrire"),
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
