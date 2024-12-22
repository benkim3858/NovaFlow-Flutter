import 'package:flutter/material.dart';

/// Filter
class ProductFilter extends StatelessWidget {
  final List<Map<String, IconData>> filterButtons = [
    {'Filter': Icons.filter_list},
    {'Ratings': Icons.keyboard_arrow_down_outlined},
    {'Size': Icons.keyboard_arrow_down_outlined},
    {'Color': Icons.keyboard_arrow_down_outlined},
    {'Price': Icons.keyboard_arrow_down_outlined},
  ];

  ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Wrap(
          spacing: 4, // 가로 간격
          alignment: WrapAlignment.spaceBetween,
          children: filterButtons.map((filter) {
            final entry = filter.entries.first;
            return OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 2),
                  Icon(entry.value, size: 14),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
