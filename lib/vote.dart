import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VotePage extends StatefulWidget {
  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  String? selectedCandidate;
  List<Map<String, dynamic>> candidates = [];
  @override
  void initState() {
    super.initState();
    fetchCandidates();
  }


  Future<void> fetchCandidates() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/candidats'));
      if (response.statusCode == 200) {
        print(response.body); // Debugging purpose (optional
        List<dynamic> fetchedCandidates = json.decode(response.body);
        setState(() {
          candidates = fetchedCandidates.map((candidate) => {
            'name': candidate['nom'] + ' ' + candidate['prenom'],
            'role': candidate['description'], // Assuming 'role' is described in 'description'
            'image': candidate['photo']
          }).toList();
        });
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
      appBar: AppBar(title: Text('Vote')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title:  Text(candidates[index]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
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
              onPressed: selectedCandidate == null ? null : () async {
                // Implement voting logic here
                var response = await http.post(
                  Uri.parse('http://localhost:3000/candidats'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'candidate': selectedCandidate!,
                  }),
                );

                if (response.statusCode == 200) {
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
                } else {
                  // Handle error case
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Failed to submit the vote.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Voter'),
            ),
          ),
        ],
      ),
    );
  }
}
