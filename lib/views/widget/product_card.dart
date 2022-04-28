import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatefulWidget {
  final String itemName;
  final String imagePath;
  final int price;
  final int salePrice;
  final int salePercent;
  final int star;


  const ProductCard(
      {Key? key,
      required this.imagePath,
      required this.price,
      required this.salePrice,
      required this.salePercent,
      required this.star,required this.itemName})
      : super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool favoriteSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Card(
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      width: 10.h,
                      height: 10.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.imagePath),
                              fit: BoxFit.cover)),
                    )),
                Container(
                  width: 10.h,
                  child: Column(
                    children: [
                      Container(
                        child: widget.salePrice != 0
                            ? Row(
                                children: [
                                  Text("${widget.salePrice}"),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Text("${widget.price}")
                                ],
                              )
                            : Text("${widget.price}"),
                      ),
                      Text(
                        widget.itemName,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              child: InkWell(
              )
          )
        ],
      ),
    );
  }
}
