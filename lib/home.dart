import 'package:flutter/material.dart';
import 'package:vote/auth.dart';
import 'package:vote/resultat.dart';
import 'package:vote/vote.dart';

import 'Details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;  // Default index for the first tab

  // Update the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {  // Assuming this is the index for the "Voter" tab
      Navigator.push(context, MaterialPageRoute(builder: (context) => VotePage()));
    }
    if (index == 2) {  // Assuming this is the index for the "Voter" tab
      Navigator.push(context, MaterialPageRoute(builder: (context) => Resultat()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Candidats 2024')),
        body: CandidatesGrid(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake),
              label: 'Voter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Results',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class CandidatesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> candidates = [
    {'name': 'Boubacar CAMARA', 'role': 'Douanier, Avocat', 'image': 'assets/boubacar.jpg'},
    {'name': 'Cheikh Tidiane DIEYE', 'role': 'Docteur en Sociologie', 'image': 'assets/cheikh.jpg'},
    {'name': 'Déthié FALL', 'role': 'Ingénieur polytechnicien', 'image': 'assets/dethie.jpg'},
    {'name': 'Daouda NDIAYE', 'role': 'Professeur titulaire des universités', 'image': 'assets/daouda.jpg'},
    {'name': 'Habib SY', 'role': 'Économiste', 'image': 'assets/habib.jpg'},
    {'name': 'Khalifa Ababacar SALEH', 'role': 'Professeur d’histoire et de géographie', 'image': 'assets/khalifa.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CandidateDetail(candidate: candidates[index]),
              ),
            );
          },

          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(candidates[index]['image']),
                ),
                SizedBox(height: 10),
                Text(candidates[index]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                Text(candidates[index]['role'], textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }
}
