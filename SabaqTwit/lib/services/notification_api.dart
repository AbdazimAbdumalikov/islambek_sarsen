import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(apiUrl + endpoint));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
