import 'package:fitness/models/diet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DietBox extends StatelessWidget {
  const DietBox({
    super.key,
    required this.diet,
  });

  final DietModel diet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: diet.boxColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(diet.iconPath),
          Column(
            children: [
              Text(
                diet.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${diet.level} | ${diet.duration} | ${diet.calorie}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xff7B6F72),
                ),
              ),
            ],
          ),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                diet.viewIsSelected
                    ? const Color(0xff9DCEFF)
                    : Colors.transparent,
                diet.viewIsSelected
                    ? const Color(0xff92A3FD)
                    : Colors.transparent,
              ]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'View',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: diet.viewIsSelected
                      ? Colors.white
                      : const Color(0xffC58BF2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
