import 'package:fitness/models/category.dart';
import 'package:fitness/models/diet.dart';
import 'package:fitness/models/popular.dart';
import 'package:fitness/widgets/category_box.dart';
import 'package:fitness/widgets/diet_box.dart';
import 'package:fitness/widgets/main_app_bar.dart';
import 'package:fitness/widgets/popular_box.dart';
import 'package:fitness/widgets/search_field.dart';
import 'package:fitness/widgets/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(appBar: AppBar()),
      body: ListView(
        children: [
          const SearchField(),
          const SizedBox(height: 40),
          Section(
            title: 'Categories',
            boxSize: 120,
            itemsList: categories,
            widgetType: CategoryBox,
            direction: Axis.horizontal,
          ),
          const SizedBox(height: 40),
          Section(
            title: 'Recommendation\nfor Diet',
            boxSize: 240,
            itemsList: diets,
            widgetType: DietBox,
            direction: Axis.horizontal,
          ),
          const SizedBox(height: 40),
          Section(
            title: 'Popular',
            boxSize: 600,
            itemsList: popularDiets,
            widgetType: PopularBox,
            direction: Axis.vertical,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
