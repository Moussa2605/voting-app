import 'package:flutter/material.dart';

class VotePage extends StatefulWidget {
  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  String? selectedCandidate;
  List<Map<String, dynamic>> candidates = [
    {'name': 'Boubacar CAMARA', 'role': 'Douanier, Avocat'},
    {'name': 'Cheikh Tidiane DIEYE', 'role': 'Docteur en Sociologie'},
    {'name': 'Déthié FALL', 'role': 'Ingénieur polytechnicien'},
    {'name': 'Daouda NDIAYE', 'role': 'Professeur titulaire des universités'},
    {'name': 'Habib SY', 'role': 'Économiste'},
    {'name': 'Khalifa Ababacar SALEH', 'role': 'Professeur d’histoire et de géographie'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vote')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(candidates[index]['name']),
                    subtitle: Text(candidates[index]['role']),
                    trailing: Radio<String>(
                      value: candidates[index]['name'],
                      groupValue: selectedCandidate,
                      onChanged: (value) {
                        setState(() {
                          selectedCandidate = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedCandidate == null ? null : () {
                // Implement voting logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Vote Confirmed'),
                    content: Text('You have voted for $selectedCandidate.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: Text(' Voter'),
            ),
          ),
        ],
      ),
    );
  }
}
