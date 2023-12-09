

import 'package:librady_app/models/book_model.dart';
import 'package:librady_app/services/http/http_client_interface.dart';


class BooksRepository {
  static const url = 'https://escribo.com/books.json';
  final IHttpClient client;

  BooksRepository(this.client);

  Future<List<BookModel>> getBooks() async {
    final response = await client.get(url);

    return response
        .map<BookModel>((bookMap) => BookModel.fromMap(bookMap))
        .toList();
  }
}
