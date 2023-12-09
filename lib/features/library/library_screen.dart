import 'package:flutter/material.dart';

import 'package:librady_app/features/library/widgets/grid_view_custom.dart';
import 'package:librady_app/models/book_model.dart';
import 'package:librady_app/repository/books_repository.dart';

import '../../services/http/http_client_package.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final repository = BooksRepository(HttpClientPackageImpl());
  Future<List<BookModel>>? futureBooks;

  @override
  void initState() {
    futureBooks = repository.getBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estante de livros'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.library_books)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Erro ao carregar dados',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          if (snapshot.hasData) {
            final listBook = snapshot.data as List<BookModel>;
            return GridViewCustom(books: listBook);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
