import 'package:flutter/material.dart';
import 'package:mini_project/components/components.dart';
import 'package:mini_project/ui/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> children = const [
    HomeTab(),
    CatalogTab(),
    // BookingProductScreen(),
    // OrderTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          //print smua
          index: currentIndex,
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: ColorPath.primary,
        unselectedItemColor: ColorPath.grey,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icHome,
              width: 20,
              color: currentIndex == 0 ? ColorPath.primary : ColorPath.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icCatalog,
              width: 20,
              color: currentIndex == 1 ? ColorPath.primary : ColorPath.grey,
            ),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icOrder,
              width: 20,
              color: currentIndex == 2 ? ColorPath.primary : ColorPath.grey,
            ),
            label: 'Order Status',
          ),
        ],
      ),
    );
  }
}
