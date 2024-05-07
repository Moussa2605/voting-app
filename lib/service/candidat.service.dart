import 'package:http/http.dart' as http;
import 'dart:convert';

class CandidatService {
  final String baseUrl = 'httphttp://localhost:3000/';

 // APIService(this.baseUrl);

  Future<Candidat> getCandidat(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        return Candidat.fromJson(response.body);
      } else {
        throw Exception('Erreur lors de la récupération des données : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors de la récupération des données : $e');
    }
  }

Future<Candidat> postCandidat(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) { // Assurez-vous de vérifier le code de statut approprié pour POST (par exemple, 201 pour une création réussie)
        return Candidat.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erreur lors de l\'envoi des données : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors de l\'envoi des données : $e');
    }
  }
  
}
