import 'package:flutter/material.dart';
import 'package:gestor_ingresos/pages/home_page/home_page.dart';

class NavigationPage extends StatefulWidget {
  static const String routeName = 'NavigationPage';

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _currentIndex = value),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getPage(_currentIndex),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(child: Text('Stats'));
      default:
        return const HomePage();
    }
  }
}
