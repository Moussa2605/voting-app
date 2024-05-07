import 'package:flutter/material.dart';

class CandidateDetail extends StatelessWidget {
  final Map<String, dynamic> candidate;

  CandidateDetail({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Candidat'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(candidate['image']),
            ),
            SizedBox(height: 20),
            Text(
              candidate['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              candidate['role'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              title: Text('Profession'),
              subtitle: Text(candidate['role']),
              leading: Icon(Icons.work),
            ),
            ListTile(
              title: Text('Âge'),
              subtitle: Text('65'), // Example age, replace with actual data if available
              leading: Icon(Icons.cake),
            ),
            Container(
              width: 130,

              child: ElevatedButton(
                onPressed: (){},
                child: Text("Voter"),
              ),
            ),
            // Additional details can be added here
            SizedBox(height: 20),
            // If there are any images or logos related to the candidate
            // Image.asset('assets/logo_pcs.png'), // Example logo
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
