import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            imageUrl,
            width: 120,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 120,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.black26),
          child: Text(
            categoryName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
