import 'package:flutter/material.dart';
import 'package:mason_money/model_views/service/category_service.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  final String menuName;

  const ProductScreen({Key? key, required this.id, required this.menuName})
      : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  CategoryService categoryService = CategoryService();
  String? selectedValue;
  int? selectedId;

  @override
  void initState() {
    // TODO: implement initState
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);
    categoryService.getCategoryChildFromApi(widget.id);
    //selectedValue = categoryChildNotifier.getCategoryList()[0].name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryService categoryService = Provider.of<CategoryService>(context);
    return Scaffold(
       body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  floating: true,
                  title: Text(
                    widget.menuName,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    child: Row(
                      children: [
                        InkWell(
                            child: SvgPicture.asset(
                          'assets/icons/sort.svg',
                          width: 5.w,
                          height: 5.w,
                        )),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                            child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          width: 5.w,
                          height: 5.w,
                        )),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          child:categoryService.getCategoryChildList().isNotEmpty ?  DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: categoryService
                                  .getCategoryChildList()
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.name,
                                        child: Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value as String;
                                  categoryService
                                      .getCategoryChildList()
                                      .forEach((element) {
                                    if (element.name == selectedValue) {
                                      selectedId = element.id;
                                    }
                                  });
                                  print(selectedId);
                                });
                              },
                            ),
                          ): const Text(""),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
    );
  }
}
