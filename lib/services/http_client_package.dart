import 'dart:convert';

import 'package:http/http.dart';
import 'package:librady_app/models/book_model.dart';
import 'package:librady_app/services/http_client_interface.dart';

class HttpClientPackageImpl implements IHttpClient {
  final client = Client();

  @override
  Future<List<BookModel>> get(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('erro ao fazer a requisição ${response.statusCode}');
  }
}
