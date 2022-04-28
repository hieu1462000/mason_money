import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuBanner extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final String imagePath;

  const MenuBanner({Key? key, required this.title, required this.onClick, required this.imagePath}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 20.h,
                //width: 350,
                //padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                      fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                left: 5,
                  bottom: 5,
                  child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),)
              )
            ],
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
}

class MenuBannerPath {
  static final List<String> path = [
    "assets/images/exclusive_sale.jpg",
    "assets/images/woman_shoes.jpg",
    "assets/images/man_shoes.jpg",
    "assets/images/special_offer.jpg",
    "assets/images/backpack.jpg",
    "assets/images/accessory.jpg",
    "assets/images/best_shoes.jpg"
  ];
}
