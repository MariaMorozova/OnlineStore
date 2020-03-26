class Categories {
  final String title;
  final String imageUrl;

  Categories({
    this.title,
    this.imageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        title: json['title'] as String,
        imageUrl: json['imageUrl'] as String,
    );
  }
}