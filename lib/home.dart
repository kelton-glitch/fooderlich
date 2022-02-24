import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home ({Key? key}) : super (key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Fooderlich', style: Theme.of(context).textTheme.headline6), 
        ),
      
      body: Center (
        child: Text(
          'Let\'s get cooking 👨‍🍳',
          style: Theme.of(context).textTheme.headline1
        )
      ),

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,

        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card1'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3'),
        ],
      ),
      
    );
  }
}