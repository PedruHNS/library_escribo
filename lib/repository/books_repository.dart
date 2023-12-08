import 'dart:convert';

import 'package:librady_app/models/book_model.dart';
import 'package:librady_app/services/http_client_interface.dart';

class BooksRepository {
  static const url = 'https://escribo.com/books.json';
  final IHttpClient client;

  BooksRepository(this.client);

  Future<List<BookModel>> getBooks() async {
    final response = await client.get(url);

    final list = jsonDecode(response.body);
    return list
        .map<BookModel>((bookMap) => BookModel.fromMap(bookMap))
        .toList();
  }
}
