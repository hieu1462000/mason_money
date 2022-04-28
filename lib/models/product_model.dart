class ProductModel {
  final String itemName;
  final String color;
  final int regularPrice;
  final int salePrice;
  final String image;
  final String imageHover;
  final int percentSale;
  final int size;
  final int star;
  final bool? isLiked;
  final int id;
  final String cdnUrl;

  ProductModel(
      {required this.itemName,
      required this.color,
      required this.regularPrice,
      required this.salePrice,
      required this.image,
      required this.imageHover,
      required this.percentSale,
      required this.size,
      required this.star,
      required this.isLiked,
      required this.id,
      required this.cdnUrl});

  static fromJson(Map<String, dynamic> json) {
    return ProductModel(
        itemName : json['itemName'],
        color : json['color'],
        regularPrice : json['regularPrice'],
        salePrice : json['salePrice'],
        image : json['image'],
        imageHover : json['imageHover'],
        percentSale : json['percentSale'],
        size : json['size'],
        star : json['star'],
        isLiked : json['isLiked'],
        id : json['id'],
        cdnUrl : json['cdnUrl'],
    );
  }
}
