import 'package:flutter/material.dart';
import 'package:mason_money/model_views/service/category_service.dart';
import 'package:mason_money/views/screens/home_screen.dart';
import 'package:mason_money/views/screens/product_screen.dart';
import 'package:mason_money/views/screens/test_screen.dart';
import 'model_views/notifier/navigator_notifier.dart';
import 'model_views/notifier/cart_notifier.dart';
import 'model_views/notifier/wish_list_notifier.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WishListNotifier(),
      ),
      ChangeNotifierProvider(
          create: (context) => CartNotifier()
      ),
      ChangeNotifierProvider(
          create: (context) => NavigatorNotifier()),
      ChangeNotifierProvider(
          create: (context) => CategoryService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NavigatorNotifier navigatorNotifier = Provider.of<NavigatorNotifier>(context,listen: false);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: '/',
          routes:{
            '/': (context) => const TestScreen(),
            '/product' : (context) =>  ProductScreen(id: navigatorNotifier.screenId, menuName: navigatorNotifier.screenName)
          },
        );
      }
    );
  }
}

