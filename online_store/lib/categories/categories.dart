class MyCategory {
  final String title;
  final String imageUrl;

  MyCategory({
    this.title,
    this.imageUrl,
  });

  factory MyCategory.fromJson(Map<String, dynamic> json) {
    return MyCategory(
        title: json['title'] as String,
        imageUrl: json['imageUrl'] as String,
    );
  }
}