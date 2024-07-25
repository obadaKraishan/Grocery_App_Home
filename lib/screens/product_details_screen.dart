import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final int reviews;
  final int deliveryTime;
  final int calories;
  final String description;
  final double price;
  final String unit;

  ProductDetailsScreen({
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.deliveryTime,
    required this.calories,
    required this.description,
    required this.price,
    required this.unit,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 2;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2FAF0),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                  ),
                  child: Center(
                    child: Image.asset(widget.imageUrl, fit: BoxFit.contain, height: 400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.green),
                              Text('${widget.rating} (${widget.reviews} reviews)'),
                            ],
                          ),
                          SizedBox(width: 40),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.green),
                              Text('${widget.deliveryTime} min'),
                            ],
                          ),
                          SizedBox(width: 40),
                          Row(
                            children: [
                              Icon(Icons.local_fire_department, color: Colors.green),
                              Text('${widget.calories} kcal'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: decreaseQuantity,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('$quantity kg', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: increaseQuantity,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.description,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                        onPressed: () {
                          showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(widget.description),
                              ),
                            ),
                          );
                        },
                        child: Text('Read more', style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: ClipOval(
                child: Material(
                  color: Colors.white, // Button color
                  child: InkWell(
                    splashColor: Colors.green, // Splash color
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.arrow_back, color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: ClipOval(
                child: Material(
                  color: Colors.green, // Button color
                  child: InkWell(
                    splashColor: Colors.white, // Splash color
                    onTap: () {
                      // Handle favorite toggle
                    },
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.favorite, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '\$${widget.price}/${widget.unit}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add to cart
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
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
