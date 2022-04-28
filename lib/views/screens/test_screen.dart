import 'package:flutter/material.dart';
import 'package:mason_money/model_views/notifier/navigator_notifier.dart';
import 'package:mason_money/model_views/service/category_service.dart';
import 'package:mason_money/views/screens/wish_list_screen.dart';
import 'package:mason_money/views/widget/menu_banner.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState() {
    // TODO: implement initState
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);
    categoryService.getCategoryFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryService categoryService = Provider.of<CategoryService>(context);
    NavigatorNotifier navigatorNotifier =
        Provider.of<NavigatorNotifier>(context, listen: false);
    return Scaffold(
      body: categoryService.getCategoryList().isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 8.w,
                            width: 8.w,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/Believe.svg',
                          width: 22.w,
                          height: 22.w,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.search,
                            size: 8.w,
                          ),
                        )
                      ],
                    ),
                    Column(
                        children: List.generate(
                            MenuBannerPath.path.length,
                            (index) => MenuBanner(
                                title: categoryService.getCategoryList()[index].name,
                                onClick: () {
                                  navigatorNotifier.changeScreen(
                                      categoryService
                                          .getCategoryList()[index]
                                          .name,
                                      categoryService
                                          .getCategoryList()[index]
                                          .id);
                                  Navigator.of(context).pushNamed('/product');
                                },
                                imagePath: MenuBannerPath.path[index])))
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
