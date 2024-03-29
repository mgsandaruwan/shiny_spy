import 'package:flutter/material.dart';
import 'package:shinespy/component/bottombar.dart';
import 'package:shinespy/content.dart';

class ArticlePage extends StatelessWidget{
  const ArticlePage ({Key? key}) : super (key: key);

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
          "Articles",
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
                      ),
                    ),

                    ArticleCard(
                      imagePath: 'images/skintype.jpg',
                      ArticleTitle: 'How to Protect Skin',
                      Description:
                      'Discover the science behind skincare with our comprehensive guide, packed with tips, tricks, and expert advice. From understanding your skin type to choosing the right products, this article covers everything you need to know to achieve a radiant complexion. ',
                    ),
                    ArticleCard(
                      imagePath: 'images/pimple.jpeg',
                      ArticleTitle: 'Unlocking the Secrets to Glowing Skin',
                      Description:
                      'Discover the science behind skincare with our comprehensive guide, packed with tips, tricks, and expert advice. From understanding your skin type to choosing the right products, this article covers everything you need to know to achieve a radiant complexion. ',
                    ),
                    ArticleCard(
                      imagePath: 'images/dryskin.jpg',
                      ArticleTitle: 'The Power of Skincare',
                      Description:
                      'Discover the science behind skincare with our comprehensive guide, packed with tips, tricks, and expert advice. From understanding your skin type to choosing the right products, this article covers everything you need to know to achieve a radiant complexion. ',
                    ),
                    ArticleCard(
                      imagePath: 'images/menskin.jpg',
                      ArticleTitle: 'Essential Tips for Healthy, Radiant Skin',
                      Description:
                      'Discover the science behind skincare with our comprehensive guide, packed with tips, tricks, and expert advice. From understanding your skin type to choosing the right products, this article covers everything you need to know to achieve a radiant complexion. ',
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
