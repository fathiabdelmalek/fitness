import 'package:fitness/models/category.dart';
import 'package:fitness/models/diet.dart';
import 'package:fitness/models/popular.dart';
import 'package:fitness/widgets/category_box.dart';
import 'package:fitness/widgets/diet_box.dart';
import 'package:fitness/widgets/main_app_bar.dart';
import 'package:fitness/widgets/popular_box.dart';
import 'package:fitness/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
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
            widget: CategoryBox,
          ),
          const SizedBox(height: 40),
          Section(
            title: 'Recommendation\nfor Diet',
            boxSize: 240,
            itemsList: diets,
            widget: DietBox,
          ),
          const SizedBox(height: 40),
          Section(
            title: 'Popular',
            boxSize: 600,
            itemsList: popularDiets,
            widget: PopularBox,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final double boxSize;
  final List itemsList;
  final Type widget;

  const Section({
    super.key,
    required this.title,
    required this.boxSize,
    required this.itemsList,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: boxSize,
          child: ListView.separated(
            itemBuilder: ((context, index) {
              if (widget.runtimeType == CategoryBox) {
                return CategoryBox(category: itemsList[index]);
              }
              if (widget.runtimeType == DietBox) {
                return DietBox(diet: itemsList[index]);
              }
              if (widget.runtimeType == PopularBox) {
                return PopularBox(popular: itemsList[index]);
              }
              return null;
            }),
            separatorBuilder: ((context, index) => const SizedBox(width: 15)),
            itemCount: itemsList.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
