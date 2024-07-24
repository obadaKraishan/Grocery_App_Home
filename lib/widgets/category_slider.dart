import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.local_florist, 'name': 'Fruits', 'color': Color(0xFF82b479)},
    {'icon': Icons.local_dining, 'name': 'Dairy', 'color': Color(0xFFFFC107)},
    {'icon': Icons.local_grocery_store, 'name': 'Vegeta', 'color': Color(0xFFFFA000)},
    {'icon': Icons.local_bar, 'name': 'Meat', 'color': Color(0xFF00BCD4)},
    {'icon': Icons.local_drink, 'name': 'Drink', 'color': Color(0xFF2196F3)},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: categories[index]['color'],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categories[index]['icon'],
                  size: 45,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Text(
                  categories[index]['name'],
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
