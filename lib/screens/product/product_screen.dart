import 'package:flutter/material.dart';
import 'package:nova_flow_flutter/widgets/product_card.dart';

import '../../widgets/categories.dart';
import '../../widgets/product_filter.dart';
import '../../widgets/product_search_bar.dart';
import '../../widgets/global_bottom_navigation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
        title: Text('카테고리 이름'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
              ))
        ],
        centerTitle: true,
        bottom: ProductSearchBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProductFilter(),
              SizedBox(
                height: 16.0,
              ),
              Categories(),
              SizedBox(
                height: 16,
              ),
              ProductCard()
            ],
          ),
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigation(
        selectedIndex: _selectedIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
