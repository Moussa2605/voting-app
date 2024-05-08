import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Resultat extends StatefulWidget {
  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
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
      final response = await http.get(Uri.parse('http://localhost:3000/candidats?filer={"include":["relation": "votes"]}'));
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
        return Card(
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
              Text("36789 voix")
            ],
          ),
        );
      },
    );
  }
}
