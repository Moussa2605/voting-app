 class User {
  String? id;
  String? login;
  String? password;
  String? cni;
  bool? isVote;
  String? nom;
  String? prenom;

  User(
      {this.id,
      this.login,
      this.password,
      this.cni,
      this.isVote,
      this.nom,
      this.prenom});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['password'];
    cni = json['cni'];
    isVote = json['isVote'];
    nom = json['nom'];
    prenom = json['prenom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['password'] = this.password;
    data['cni'] = this.cni;
    data['isVote'] = this.isVote;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    return data;
  }
}