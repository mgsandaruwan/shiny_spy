import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget{
  const ShopPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){

    return Container(
        color: Colors.black,
        child: Center(
            child: Text(
                "Shop Page",
        style: TextStyle(color: Colors.white)
    )
        ));
  }
}