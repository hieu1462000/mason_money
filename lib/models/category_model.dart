class CategoryModel {
  final String name;
  final int id;
  final String imgUrl;
  final String cdnUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.cdnUrl,
  });

  static fromJson(Map<String, dynamic> json){
    return CategoryModel(
        id: json['id'].toInt() ?? -1 ,
        name: json['name'] ?? "",
        imgUrl: json['imgUrl']  ?? "",
        cdnUrl: json['cdnUrl'] ?? "",
    );
  }

}