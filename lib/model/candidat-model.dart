import 'package:vote/model/vote-model.dart';

class Candidat {
  String? id;
  String? nom;
  String? prenom;
  int? age;
  String? photo;
  String? description;
  String? programme;
  List<Vote>? votes;

  Candidat(
      {this.id,
      this.nom,
      this.prenom,
      this.age,
      this.photo,
      this.description,
      this.programme,
      this.votes});

  Candidat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    age = json['age'];
    photo = json['photo'];
    description = json['description'];
    programme = json['programme'];
    if (json['votes'] != null) {
      votes = <Vote>[];
      json['votes'].forEach((v) {
        votes!.add(new Vote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['age'] = this.age;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['programme'] = this.programme;
    if (this.votes != null) {
      data['votes'] = this.votes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}