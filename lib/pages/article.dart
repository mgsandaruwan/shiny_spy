import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget{
  const ArticlePage ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        color: Colors.black,
        child: Center(
          child: Text(
              "Article Page",
              style: TextStyle(color: Colors.white)
          ),
        )
    );
  }

}