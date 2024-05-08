import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vote/auth.dart';
import 'package:vote/resultat.dart';
import 'package:vote/vote.dart';
import 'package:http/http.dart' as http;

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


class CandidatesGrid extends StatefulWidget {
  @override
  _CandidatesGridState createState() => _CandidatesGridState();
}

class _CandidatesGridState extends State<CandidatesGrid> {
  List<Map<String, dynamic>> candidates = [];
  bool isLoading = true;  // Track loading state

  @override
  void initState() {
    super.initState();
    fetchCandidates();
  }

  Future<void> fetchCandidates() async {
    try {
      setState(() => isLoading = true);
      final response = await http.get(Uri.parse('http://localhost:3000/candidats'));
      if (response.statusCode == 200) {
        List<dynamic> fetchedCandidates = json.decode(response.body);
        setState(() {
          candidates = fetchedCandidates.map((candidate) => {
            'name': candidate['nom'] + ' ' + candidate['prenom'],
            'role': candidate['description'],
            'image': candidate['photo']
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load candidates');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('Error fetching candidates: $e');
      // Consider showing an alert dialog or a Snackbar here
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: CircularProgressIndicator()) : buildGridView();
  }

  Widget buildGridView() {
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
                  backgroundImage: Image.memory(
                      base64Decode(candidates[index]['image'].split(',').last)
                  ).image,
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
