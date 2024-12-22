import 'package:flutter/material.dart';

/// SearchBar - 검색창
class ProductSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBar();

  @override
  Size get preferredSize => Size.fromHeight(60.0); // PreferredSizeWidget 구현
}

class _ProductSearchBar extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search products',
            prefixIcon: Icon(Icons.search), // 왼쪽 검색 아이콘
            suffixIcon: Icon(Icons.camera_alt_outlined), // 오른쪽 카메라 아이콘
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
          ),
        ),
      ),
    );
  }
}
