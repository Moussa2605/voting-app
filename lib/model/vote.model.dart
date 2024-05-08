import 'package:flutter/material.dart';
class Vote {
  String? id;
  String? nom;
  String? prenom;
  int? age;
  String? photo;
  String? description;
  String? programme;

  Vote(
      {required this.id,
        required this.nom,
        required this.prenom,
        required this.age,
        required this.photo,
        required this.description,
        required this.programme});

  Vote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    age = json['age'];
    photo = json['photo'];
    description = json['description'];
    programme = json['programme'];
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
    return data;
  }
}
