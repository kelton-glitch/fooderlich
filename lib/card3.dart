import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      constraints: const BoxConstraints.expand(width: 350,
      height: 450),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/mag2.png'),
        fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children:[
          //TODO 5: add dark overlay BoxDecoration
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          //TODO6: Add Container, Column, Icon and Text
          //TODO 7: Add Center widget with Chip widget children
        ],
      ),
      ),
    );
  }
}