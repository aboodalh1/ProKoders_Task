class Products {
  Products({
    this.id,
    this.title,
    this.description, this.images,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    images = json['images'] != null ?  json['images'].cast<String>() : [];
    description = json['description'];
  }
  num? id;
  String? title;
  List<String>? images;
  String? description;
  Products copyWith({  num? id,
    String? title,
    num? price,
  }) => Products(  id: id ?? this.id,
    images: images ?? images,
    title: title ?? this.title,
    description: description ?? description,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = description;
    return map;
  }

}