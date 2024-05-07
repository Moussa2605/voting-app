import 'package:flutter/material.dart';

class Resultat extends StatelessWidget {
  final List<Map<String, dynamic>> candidates = [
    {'name': 'Boubacar CAMARA', 'role': 'Expert en Douane', 'image': 'assets/person1.jpg', 'votes': 150},
    {'name': 'Cheikh Tidiane DIEYE', 'role': 'Consultant en Sociologie', 'image': 'assets/person2.jpg', 'votes': 250},
    {'name': 'Déthié FALL', 'role': 'Ingénieur en Technologies', 'image': 'assets/person3.jpg', 'votes': 200},
    {'name': 'Daouda NDIAYE', 'role': 'Professeur de Sciences', 'image': 'assets/person4.jpg', 'votes': 300},
    {'name': 'Habib SY', 'role': 'Analyste Économique', 'image': 'assets/person5.jpg', 'votes': 180},
    {'name': 'Khalifa Ababacar SALEH', 'role': 'Historien', 'image': 'assets/person6.jpg', 'votes': 220}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidats'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shadowColor: Colors.grey[50],
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(candidates[index]['image']),
                ),
                SizedBox(height: 10),
                Text(
                  candidates[index]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  candidates[index]['role'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${candidates[index]['votes']} votes',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
