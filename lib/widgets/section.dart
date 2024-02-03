import 'package:fitness/widgets/category_box.dart';
import 'package:fitness/widgets/diet_box.dart';
import 'package:fitness/widgets/popular_box.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final double boxSize;
  final List itemsList;
  final Type widgetType;
  final Axis direction;

  const Section({
    Key? key,
    required this.title,
    required this.boxSize,
    required this.itemsList,
    required this.widgetType,
    required this.direction,
  }) : super(key: key);

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
            itemBuilder: (context, index) {
              if (widgetType == CategoryBox) {
                return CategoryBox(category: itemsList[index]);
              } else if (widgetType == DietBox) {
                return DietBox(diet: itemsList[index]);
              } else if (widgetType == PopularBox) {
                return PopularBox(popular: itemsList[index]);
              }
              return Container(); // Return a default widget or an empty container
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: itemsList.length,
            scrollDirection: direction,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
