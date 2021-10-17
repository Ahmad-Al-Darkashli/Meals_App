import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(this.title, this.imageUrl, this.duration, this.complexity,
      this.affordability,
      {Key? key})
      : super(key: key);

  void selectMael() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMael,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
