
class BookModel {
  final int id;
  final String title;
  final String author;
  final String image;
  final String download;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.download,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      image: map['cover_url'] ?? '',
      download: map['download_url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, image: $image, download: $download)';
  }
}
