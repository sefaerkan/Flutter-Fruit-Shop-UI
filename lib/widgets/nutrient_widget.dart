import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/data.dart';
import '../utils/utils.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;

  const NutrientWidget({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${product.nutrients[index][1]}/5",
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: buildIndicators(
              product.nutrients[index][0],
              int.parse(
                product.nutrients[index][1],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildIndicators(String nutrientType, int value) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i < value
          ? indicator(true, nutrientType)
          : indicator(false, nutrientType));
    }
    return list;
  }

  Widget indicator(bool isActive, String nutirentType) {
    IconData? icon;
    switch (nutirentType) {
      case "Energy":
        icon = FontAwesomeIcons.bolt;
        break;
      case "Freshness":
        icon = FontAwesomeIcons.glassWater;
        break;
      case "Vitamin":
        icon = Icons.rocket_launch_rounded;
        break;
      case "Calories":
        icon = FontAwesomeIcons.fire;
        break;
    }
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: Icon(
        icon,
        color: isActive == true ? product.nutrientsColor : Colors.black12,
        size: 16,
      ),
    );
  }
}
