import 'package:flutter/material.dart';
import 'package:food_shop/components/app_button.dart';
import 'package:food_shop/pages/check_out_page.dart';
import 'package:food_shop/styles/app_size.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  // Sample cart items (mimicking the screenshot)
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/products/green-fresh-broccoli.png',
      'name': 'Fresh Broccoli',
      'price': 2.22,
      'quantity': 5,
      'unit': '1.50 lbs',
      // Highlight the first item row with a light green background
      'rowColor': Colors.green.withOpacity(0.1),
      // This item shows a static quantity (like in the screenshot)
      'showDelete': false,
      'showMinus': false,
    },
    {
      'image': 'assets/images/products/grapes.png',
      'name': 'Black Grapes',
      'price': 3.50,
      'quantity': 5,
      'unit': '5.0 lbs',
      // White background for subsequent items
      'rowColor': Colors.white,
      // This item has a trash icon (instead of a minus icon)
      'showDelete': true,
      'showMinus': false,
    },
    {
      'image': 'assets/images/products/aocado.png',
      'name': 'Avocado',
      'price': 4.00,
      'quantity': 2,
      'unit': '2.0 lbs',
      'rowColor': Colors.white,
      'showDelete': false,
      'showMinus': true,
    },
    {
      'image': 'assets/images/products/pineapple-pieces.png',
      'name': 'Pineapple',
      'price': 5.00,
      'quantity': 1,
      'unit': 'dozen',
      'rowColor': Colors.white,
      'showDelete': false,
      'showMinus': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate subtotal dynamically
    double subTotal = 0.0;
    for (var item in cartItems) {
      subTotal += (item['price'] as double) * (item['quantity'] as int);
    }
    double shippingCharges = 0.0; // Based on your logic
    double total = subTotal + shippingCharges;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Shopping Cart',
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // Cart items list
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: 90,
                    child: Row(
                      children: [
                        // Product image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Product info
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Price row (e.g., $2.22 x 5)
                              Text(
                                '\$${item['price'].toStringAsFixed(2)} x ${item['quantity']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // Name
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                item['unit'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Quantity + actions
                        SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              // Plus icon
                              SizedBox(
                                height: 30,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                              Text(
                                item['quantity'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Show either a trash or minus icon depending on item config

                              SizedBox(
                                height: 30,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Cart Summary
          Container(
            height: AppSize.responsiveHeight(234),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12), right: Radius.circular(12)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '\$${subTotal.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Shipping Charges
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shipping charges',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '\$${shippingCharges.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Checkout Button
                AppButton(
                    text: 'CheckOut',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CheckOutPage(),
                      ));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
