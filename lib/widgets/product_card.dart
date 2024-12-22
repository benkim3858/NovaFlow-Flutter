import 'package:flutter/material.dart';

/// Newly add products 부분
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // Column 내부에서 사용하기 위해 필요
      physics: NeverScrollableScrollPhysics(), // 그리드뷰 자체 스크롤 비활성화
      crossAxisCount: 2, // 한 행에 3개의 아이템
      mainAxisSpacing: 16, // 세로 간격
      crossAxisSpacing: 16, // 가로 간격
      childAspectRatio: 0.45,
      children: [
        ProductItem(
          imagePath: 'asset/img/image_1.jpeg',
          price: 400,
        ),
        ProductItem(
          imagePath: 'asset/img/image_2.jpeg',
          price: 100,
        ),
        ProductItem(
          imagePath: 'asset/img/image_1.jpeg',
          price: 400,
        ),
        ProductItem(
          imagePath: 'asset/img/image_2.jpeg',
          price: 100,
        ),
      ],
    );
  }
}

/// ProductItem - 상품
class ProductItem extends StatelessWidget {
  final String imagePath;
  final double price;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_detail');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상품 이미지
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 234,
                fit: BoxFit.cover,
              ),
            ),
            // 제품 정보
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 브랜드명
                  Text(
                    'H&M',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  // 제품명
                  Text(
                    'Regular Fit Linen-blend T-shirt',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  // 평점
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' (236)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  // 가격
                  Text(
                    '\$$price.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
