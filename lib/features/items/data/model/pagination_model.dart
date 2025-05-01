import 'package:prokoders_login_task/features/items/data/model/product_model.dart';

class PaginationModel {
  PaginationModel({
      this.products, 
      this.total, 
      this.skip, 
      this.limit,});

  PaginationModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Products>? products;
  num? total;
  num? skip;
  num? limit;
PaginationModel copyWith({  List<Products>? products,
  num? total,
  num? skip,
  num? limit,
}) => PaginationModel(  products: products ?? this.products,
  total: total ?? this.total,
  skip: skip ?? this.skip,
  limit: limit ?? this.limit,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

