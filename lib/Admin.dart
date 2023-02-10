class Admin {
  int id;
  String email;
  String password;
  String name;
  Admin(this.email, this.password, this.name, this.id);
  Admin.fromJson(Map<dynamic, dynamic> json)
      : email = json["email"] as String,
        password = json["password"] as String,
        name = json["name"] as String,
        id = int.parse(json["uid"]);
  static List<Admin> dealsfromapi(List api) {
    return api.map((e) {
      return Admin.fromJson(e);
    }).toList();
  }
}
