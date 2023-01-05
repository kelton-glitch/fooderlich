import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

//1
  class Home extends StatefulWidget{
    const Home ({super.key});

    @override
    HomeState createState() => HomeState();
  }
  class HomeState extends State<Home> {
    //TODO: Add state variables and functions
    int _selectedIndex = 0;

    static List<Widget> pages = <Widget>[
      const Card1(),
      const Card2(),
      const Card3(),
    ];

    //9
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            // 2
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // Show selected tab
        body:pages[_selectedIndex],
        // Bottom navigation bar
        //4
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          //TODO: Set selected tab bar
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          //6
          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card3',
            ),
          ],
        ),
      );
    }
  }