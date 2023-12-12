import 'package:flutter/material.dart';
import 'package:librady_app/features/library/widgets/card_book.dart';
import 'package:librady_app/models/book_model.dart';

class GridViewCustom extends StatelessWidget {
  final List<BookModel> books;
  const GridViewCustom({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: books.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 4),
      itemBuilder: (context, index) {
        return CardBook(
          image: books[index].image,
          title: books[index].title,
          download: books[index].download,
        );
      },
    );
  }
}
