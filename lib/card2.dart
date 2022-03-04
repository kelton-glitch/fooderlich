import 'package:flutter/material.dart';
import 'package:fooderlich/author_card.dart';


class Card2 extends StatelessWidget {
  const Card2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

        child: Column(
          children: [
            ///TODO1: add author info
            const AuthorCard(
              authorName: 'Kamgo Elton',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
            ),
            ///TODO4: add Positioned Text
        ],
        ),
      ),
      
    );
  }
}