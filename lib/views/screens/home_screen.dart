import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model_views/notifier/navigator_notifier.dart';
import 'package:mason_money/models/category_model.dart';
import 'package:mason_money/models/repositories/category_repositories.dart';
import 'package:mason_money/models/sources/remote/responses/list_model_responses.dart';
import 'package:mason_money/views/widget/menu_banner.dart';
import 'package:sizer/sizer.dart';
import 'cart_screen.dart';
import 'wish_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: 'Cart'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        onTap: onTapBottomBarHandler,
      ),
    );
  }

  Widget body() {
    if (_currentIndex == 0) {
      return const HomeBody();
    } else if (_currentIndex == 1) {
      return WishListScreen();
    } else {
      return CartScreen();
    }
  }

  void onTapBottomBarHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  CategoryRepositories categoryRepositories = CategoryRepositories();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListModelResponse>(
      future: categoryRepositories.getParentCategories(),
        builder: (context, snapshot) {
        if(snapshot.hasData) {
          return _buildHomeScreen(snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error : ${snapshot.error}"),
                ],
              ));
        } else {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [//Text("Loading data from API...",),
                  CircularProgressIndicator()],
              ));
        }
        }
    );
  }

  Widget _buildHomeScreen(ListModelResponse data) {
    NavigatorNotifier navigatorNotifier = Provider.of<NavigatorNotifier>(context, listen: false);
    List<CategoryModel> _categoryModel = data.data as List<CategoryModel>;
    return SingleChildScrollView(
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
                  onTap: (){},
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
                        title: _categoryModel[index].name ,
                        onClick: () {
                          navigatorNotifier.changeScreen(_categoryModel[index].name, _categoryModel[index].id);
                          Navigator.of(context).pushNamed('/product');
                        },
                        imagePath: MenuBannerPath.path[index])))
          ],
        ),
      ),
    );
  }
}
