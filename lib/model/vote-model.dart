import 'package:vote/model/user-model.dart';

class Vote {
  String? id;
  String? candidatId;
  String? userId;
  String? candidat;
  String? foreignKey;
  User? user;

  Vote(
      {this.id,
      this.candidatId,
      this.userId,
      this.candidat,
      this.foreignKey,
      this.user});

  Vote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidatId = json['candidatId'];
    userId = json['userId'];
    candidat = json['candidat'];
    foreignKey = json['foreignKey'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['candidatId'] = this.candidatId;
    data['userId'] = this.userId;
    data['candidat'] = this.candidat;
    data['foreignKey'] = this.foreignKey;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}