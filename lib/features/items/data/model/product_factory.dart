import 'package:prokoders_login_task/features/items/data/model/product_model.dart';

class ProductFactory {

  static Products createWithParams({
    required int id,
    required String title,
    required String description,
    required List<String>image,
  }) {
    return Products(id: id, title: title, description: description, images: image);
  }

  static Products createFromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: json['images'],
    );
  }
}