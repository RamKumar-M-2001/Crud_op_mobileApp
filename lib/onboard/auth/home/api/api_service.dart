import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:master_go_replication/onboard/auth/home/api/model.dart';

class ApiService {
  final String apiurl = "https://jsonplaceholder.typicode.com/users";

  Future<List<usermodel>> fatchusers() async {
    final response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<usermodel> users =
          body.map((dynamic item) => usermodel.fromjson(item)).toList();
      return users;
    } else {
      throw Exception("Failed to load users");
    }
  }
}
