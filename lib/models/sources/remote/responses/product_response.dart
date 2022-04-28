import 'dart:convert';

import 'package:mason_money/models/product_model.dart';



class ListProductResponse {
  final int status;
  final String? message;
  final List<ProductModel>? data;
  final int totalPage;
  final int totalRow;
  final String? type;
  final String? title;
  final String? detail;
  final String? instance;

  ListProductResponse({
    required this.status,
    this.message,
    this.data,
    required this.totalPage,
    required this.totalRow,
    this.type,
    this.title,
    this.detail,
    this.instance,
  });

  factory ListProductResponse.fromMap(Map<String, dynamic> map) {
    return ListProductResponse(
      status: map['status']?.toInt() ?? 0,
      message: map.containsKey("message") ? map['message'] : null,
      data: map.containsKey("data") && map["data"] != null
          ? List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromJson(x)))
          : null,
      totalPage: map.containsKey("totalPage") ? map['totalPage'].toInt() : 0,
      totalRow: map.containsKey("totalRow") ? map['totalRow'].toInt() : 0,
      type: map.containsKey("type") ? map['type'] : null,
      title: map.containsKey("title") ? map['title'] : null,
      detail: map.containsKey("detail") ? map['detail'] : null,
      instance: map.containsKey("instance") ? map['instance'] : null,
    );
  }

  factory ListProductResponse.fromJson(String source) =>
      ListProductResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListProductResponse(status: $status, message: $message, data: $data, totalPage: $totalPage, totalRow: $totalRow, type: $type, title: $title, detail: $detail, instance: $instance)';
  }
}
