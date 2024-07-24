import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:grocery_market/widgets/category_slider.dart';
import 'package:grocery_market/widgets/discount_banner.dart';
import 'package:grocery_market/widgets/grocery_item.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'imageUrl': 'assets/apple.png', 'name': 'Green Apple', 'rating': 4.6, 'price': 9.99, 'unit': 'kg'},
    {'imageUrl': 'assets/lemon.png', 'name': 'Green Lemon', 'rating': 4.8, 'price': 6.99, 'unit': 'kg'},
    {'imageUrl': 'assets/orange.png', 'name': 'Orange', 'rating': 4.5, 'price': 8.99, 'unit': 'kg'},
    {'imageUrl': 'assets/cheese.png', 'name': 'Strawberry', 'rating': 4.7, 'price': 10.99, 'unit': 'kg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for groceries',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              DiscountBanner(),
              SizedBox(height: 20),
              CategorySlider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle See All
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (products.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              GroceryItem(
                                imageUrl: products[index * 2]['imageUrl'],
                                name: products[index * 2]['name'],
                                rating: products[index * 2]['rating'],
                                price: products[index * 2]['price'],
                                unit: products[index * 2]['unit'],
                              ),
                              if ((index * 2 + 1) < products.length)
                                GroceryItem(
                                  imageUrl: products[index * 2 + 1]['imageUrl'],
                                  name: products[index * 2 + 1]['name'],
                                  rating: products[index * 2 + 1]['rating'],
                                  price: products[index * 2 + 1]['price'],
                                  unit: products[index * 2 + 1]['unit'],
                                ),
                            ],
                          ),
                        ),
                        if ((index * 2 + 2) < products.length) SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        color: Colors.white,
        backgroundColor: Color(0xFF82b479),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          // Handle tab selection
        },
      ),
    );
  }
}
