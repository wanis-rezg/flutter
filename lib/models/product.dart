import 'comment.dart'; // استيراد نموذج التعليق

class Product {
  final String imagePath;
  final String name;
  final String price;
  final String description;
  final List<String> specifications;
    List<Comment> comments; // قائمة التعليقات

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    required this.specifications,
    this.comments = const [], // تهيئة قائمة التعليقات كقائمة فارغة افتراضياً
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}