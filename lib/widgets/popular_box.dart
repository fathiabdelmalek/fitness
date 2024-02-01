import 'package:fitness/models/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularBox extends StatelessWidget {
  const PopularBox({
    super.key,
    required this.popular,
  });

  final PopularDietsModel popular;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: popular.boxIsSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: popular.boxIsSelected
            ? [
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.07),
                  offset: const Offset(0, 10),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            popular.iconPath,
            width: 65,
            height: 65,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                popular.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${popular.level} | ${popular.duration} | ${popular.calorie}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xff7B6F72),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/button.svg',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
