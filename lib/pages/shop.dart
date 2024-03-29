import 'package:flutter/material.dart';
import 'package:shinespy/component/bottombar.dart';
import 'package:shinespy/product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Skin Care Products",
          style: TextStyle(color: Colors.white),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNav()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryButton(context, "Kids"),
              buildCategoryButton(context, "Women"),
              buildCategoryButton(context, "Men"),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        width: screenWidth / 1.2,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1.0,
                        ),
                      ),
                    ),

                    ProductCard(
                      imagePath: 'images/nivea.jpeg',
                      ProductTitle: 'Nivea cream',
                      Description:
                      'Nivea cream: A trusted skincare essential. Intensely moisturizes, softens, and protects skin. Suitable for all skin types.',
                      price: 'Rs 2000.00',
                    ),
                    ProductCard(
                      imagePath: 'images/deodrant.jpg',
                      ProductTitle: 'Nivea Deodrant',
                      Description:
                      'Nivea cream: A trusted skincare essential. Intensely moisturizes, softens, and protects skin. Suitable for all skin types.',
                      price: 'Rs 3500.00',
                    ),
                    ProductCard(
                      imagePath: 'images/facewash.jpg',
                      ProductTitle: 'Nivea FaceWash',
                      Description:
                      'Nivea cream: A trusted skincare essential. Intensely moisturizes, softens, and protects skin. Suitable for all skin types.',
                      price: 'Rs 4500.00',
                    ),
                    ProductCard(
                      imagePath: 'images/cocobutter.jpg',
                      ProductTitle: 'Nivea CocoButter Cream',
                      Description:
                      'Nivea cream: A trusted skincare essential. Intensely moisturizes, softens, and protects skin. Suitable for all skin types.',
                      price: 'Rs 1500.00',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(BuildContext context, String category) {
    return ElevatedButton(
      onPressed: () {
        // Add navigation logic for each category
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFEFE8A2), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
