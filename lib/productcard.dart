import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.ProductTitle,
    required this.Description,
    required this.price,
  }) : super(key: key);

  final String imagePath;
  final String ProductTitle;
  final String Description;
  final String price;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color(0xFFEFE8A2),
          width: 2.0,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(imagePath),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ProductTitle,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      Description,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          // Add button functionality
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFEFE8A2)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ],
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