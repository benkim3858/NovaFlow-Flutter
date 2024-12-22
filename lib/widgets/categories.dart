import 'package:flutter/material.dart';

// 카테고리 데이터 모델
class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

// 카테고리 데이터
final List<Category> categories = [
  Category(name: 'Women', image: 'asset/img/image_1.jpeg'),
  Category(name: 'Men', image: 'asset/img/image_2.jpeg'),
  Category(name: 'Teens', image: 'asset/img/image_3.jpeg'),
  Category(name: 'Kids', image: 'asset/img/image_4.jpeg'),
  Category(name: 'Baby', image: 'asset/img/image_5.jpeg'),
];

/// Categories - 카테고리
class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/product');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(categories[index].image),
                  ),
                  SizedBox(height: 8),
                  Text(categories[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
