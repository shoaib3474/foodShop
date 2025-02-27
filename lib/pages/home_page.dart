import 'package:flutter/material.dart';
import 'package:food_shop/components/app_textfield.dart';
import 'package:food_shop/pages/card_page.dart';
import 'package:food_shop/pages/category_page.dart';
import 'package:food_shop/styles/app_size.dart';
import 'package:food_shop/styles/app_text.dart';
import 'package:food_shop/styles/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/cetagory.dart';
import '../models/products.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                hintText: 'Search keywords',
                prefixIcon: Icons.search,
                suffixIcon: Icons.sort,
              ),
              SizedBox(height: 20),
              // Promotional Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.banner_image,
                      width: AppSize.responsiveHeight(380),
                      height: AppSize.responsiveHeight(283),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: AppSize.responsiveWidth(61),
                      top: AppSize.responsiveHeight(137),
                      child: Text(
                        '20% off on your\nfirst purchase',
                        style: AppText.poppinsTextStyle,
                      ),
                    ),
                    Positioned(
                      left: AppSize.responsiveWidth(33),
                      top: AppSize.responsiveHeight(248),
                      child: AnimatedSmoothIndicator(
                        activeIndex: 1,
                        count: 3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Categories Section
              Text(
                'Categories',
                style: AppText.poppinsTextStyle,
              ),
              SizedBox(
                height: 78, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appData['images'].length,
                  itemBuilder: (context, index) {
                    return _buildCategory(
                      appData['images'][index],
                      appData['categories'][index],
                      context,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Featured Products Section
              Text(
                'Featured products',
                style: AppText.poppinsTextStyle,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return buildProductCard(products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardPage(),
              ));
        },
        backgroundColor: Color(0xFF6CC51D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(68),
        ),
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildCategory(String icon, String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryPage(),
              ));
            },
            child: CircleAvatar(
              radius: 26,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  icon,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, dynamic> product) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          // Main content of the card.
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Image.asset(
                  product['image'],
                  height: 80,
                ),
              ),
              Text(
                '\$${product['price'].toString()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(product['name'], style: AppText.poppinsTextStyle1),
              SizedBox(height: 5),
              Text(
                product['unit'],
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              Divider(
                height: 20,
              ),
              // Elevated button with icon on the left side.
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5),
                    Text('Add to Cart')
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          // Favorite icon at top-right corner.
          Positioned(
            top: 4,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.redAccent),
              onPressed: () {
                // Handle favorite action here.
              },
            ),
          ),
        ],
      ),
    );
  }
}
