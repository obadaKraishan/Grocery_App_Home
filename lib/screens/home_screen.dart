import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:grocery_market/widgets/category_slider.dart';
import 'package:grocery_market/widgets/discount_banner.dart';
import 'package:grocery_market/widgets/grocery_item.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'imageUrl': 'assets/apple.png', 'name': 'Green Apple', 'rating': 4.6, 'reviews': 567, 'deliveryTime': 10, 'calories': 32, 'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc aliquam augue eget tellus egestas eleifend. Morbi tristique felis quis tellus aliquam, eget tincidunt felis aliquet. Proin rhoncus molestie auctor. Ut non dui augue. Nunc accumsan, ligula sit amet finibus vulputate, arcu lacus accumsan est, ut euismod sapien magna non elit. Cras sed consequat dolor. Nulla non sem quis nulla hendrerit tempor nec vel leo. Maecenas sit amet pulvinar erat. Fusce sodales euismod turpis quis dignissim. Aliquam erat volutpat. Aliquam bibendum felis vitae vestibulum varius. Nulla imperdiet viverra volutpat. Etiam velit sapien, mattis faucibus elit ac, congue facilisis ante. Mauris quam purus, fermentum eu est id, rhoncus tempor justo. Vestibulum blandit leo varius massa viverra, eget tincidunt metus eleifend.', 'price': 9.99, 'unit': 'kg'},
    {'imageUrl': 'assets/lemon.png', 'name': 'Green Lemon', 'rating': 4.8, 'reviews': 432, 'deliveryTime': 15, 'calories': 25, 'description': 'Lorem ipsum dolor sit amet...', 'price': 6.99, 'unit': 'kg'},
    {'imageUrl': 'assets/orange.png', 'name': 'Orange', 'rating': 4.5, 'reviews': 389, 'deliveryTime': 12, 'calories': 50, 'description': 'Lorem ipsum dolor sit amet...', 'price': 8.99, 'unit': 'kg'},
    {'imageUrl': 'assets/cheese.png', 'name': 'Strawberry', 'rating': 4.7, 'reviews': 298, 'deliveryTime': 8, 'calories': 15, 'description': 'Lorem ipsum dolor sit amet...', 'price': 10.99, 'unit': 'kg'},
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              imageUrl: products[index]['imageUrl'],
                              name: products[index]['name'],
                              rating: products[index]['rating'],
                              reviews: products[index]['reviews'],
                              deliveryTime: products[index]['deliveryTime'],
                              calories: products[index]['calories'],
                              description: products[index]['description'],
                              price: products[index]['price'],
                              unit: products[index]['unit'],
                            ),
                          ),
                        );
                      },
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
