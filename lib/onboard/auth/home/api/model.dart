class usermodel {
  final int id;
  final String name;
  final String email;

  usermodel({required this.id, required this.name, required this.email});

  factory usermodel.fromjson(Map<String, dynamic> json) {
    return usermodel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
    );
  }
}
