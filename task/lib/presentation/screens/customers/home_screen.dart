import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/presentation/screens/customers/menu_screen.dart';
import 'package:task/presentation/screens/customers/orders_screen.dart';
import 'package:task/presentation/screens/customers/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentScreen = 0;
  final List<Widget> screens = [
    MenuScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        ),
        child: BottomNavigationBar(
          selectedItemColor: Appcolors.night,
          currentIndex: currentScreen,
          onTap: (index){
            setState(() {
              currentScreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: currentScreen == 0 
                  ? Icon(IconlyBold.home)
                  :Icon(IconlyLight.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: currentScreen == 1 
                  ? Icon(IconlyBold.bag)
                  : Icon(IconlyLight.bag),
              label: "Orders"
            ),
            BottomNavigationBarItem(
              icon: currentScreen == 2 
                  ? Icon(IconlyBold.profile)
                  :Icon(IconlyLight.profile),
              label: "Profile"
            ),

          ]),
      ),
    );
  }
}