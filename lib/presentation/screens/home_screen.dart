import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mqh_rommel/presentation/screens/demo1_screen.dart';
import 'package:mqh_rommel/presentation/screens/demo2_screen.dart';
import 'package:mqh_rommel/presentation/screens/demo_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de las páginas que se mostrarán en el IndexedStack
  final List<Widget> _pages = [
    DemoScreen(),
    DemoScreen1(),
    DemoScreen2(),
  ];

  // Cambiar el índice seleccionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Temas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Niveles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Progreso',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}


