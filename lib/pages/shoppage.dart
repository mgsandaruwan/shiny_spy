import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shinespy/component/bottombar.dart';
import 'package:shinespy/productcard.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Level').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> levelSnapshot) {
          if (!levelSnapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> levelDocs = levelSnapshot.data!.docs;

          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('oillevel').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> oilSnapshot) {
              if (!oilSnapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<DocumentSnapshot> oilLevelDocs = oilSnapshot.data!.docs;

              List<ProductCard> productCards = [];

              // Compare level values between collections
              for (var levelDoc in levelDocs) {
                var level = levelDoc['level'];
                try {
                  var oilLevelDoc = oilLevelDocs.firstWhere((doc) => doc['level'] == level);
                  String productTitle = levelDoc['ProductTitle'] ?? '';
                  String description = levelDoc['Description'] ?? '';
                  String price = levelDoc['price'] ?? '';
                  String imagePath = levelDoc['imagePath'] ?? '';

                  productCards.add(ProductCard(
                    ProductTitle: productTitle,
                    Description: description,
                    price: price,
                    imagePath : imagePath,
                  ));
                } catch (e) {
                  print('Oil level document not found for level: $level');
                }
              }

              return ListView(
                children: productCards,
              );
            },
          );
        },
      ),
    );
  }



Widget buildCategoryButton(BuildContext context, String category) {
    return ElevatedButton(
      onPressed: () {
        // Add navigation logic for each category
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFEFE8A2), // Button color
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
