import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String baseUrl = 'http://localhost:3000/';

  Future<User> getUser(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erreur lors de la récupération des données : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors de la récupération des données : $e');
    }
  }

  Future<User> login(String login, String password) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/login/$login/$password'));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erreur lors de la récupération des données : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors de la récupération des données : $e');
    }
  }

  Future<User> postUser(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) { // Vérifiez le code de statut approprié pour POST
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erreur lors de l\'envoi des données : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors de l\'envoi des données : $e');
    }
  }
}
