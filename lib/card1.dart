import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread';
  final String chef = 'Kamgo Elton';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag1.png'),
            fit: BoxFit.cover,
          ),
        ),

      child:Stack (
        children: [
          Text(category, style: 
          FooderlichTheme.darkTextTheme.bodyText1),
          Text(title, style: 
          FooderlichTheme.darkTextTheme.headline5),
          Text(description, style: 
          FooderlichTheme.darkTextTheme.bodyText1),
          Text(chef, style: 
          FooderlichTheme.darkTextTheme.bodyText1),
        ],
      ),
      
      ),

    );
  }
}
