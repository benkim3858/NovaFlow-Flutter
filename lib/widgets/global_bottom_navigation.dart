import 'package:flutter/material.dart';

/// BottomNavigation
class GlobalBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const GlobalBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: SafeArea(
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onIndexChanged,
          selectedFontSize: 11,
          unselectedFontSize: 9,
          iconSize: 18,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
