import 'package:coindcx/constant/info.dart';
import 'package:coindcx/views/home/homepage.dart';
import 'package:coindcx/views/home/price.dart';
import 'package:coindcx/views/home/profile.dart';
import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  void _onItemTapped(int index) {
    setState(() {
      Apkdata.selectedIndex = index;
    });
  }

  var screens = [
    const MyHomePage(),
    const Pricepage(),
    const Pricepage(),
    const Pricepage()
  ];
  @override
  Widget build(BuildContext context) {
            return Scaffold(
              body: SafeArea(
                child: IndexedStack(
                  index: Apkdata.selectedIndex,
                  children: const [
                    MyHomePage(),
                    Pricepage(),
                    Profilepage(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(color: Colors.blue[200]),
                selectedIconTheme: IconThemeData(color: Colors.blue[200]),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.area_chart_rounded),
                    label: 'Prices',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    label: 'Profile',
                  ),
                ],
                currentIndex: Apkdata.selectedIndex,
                selectedItemColor: Colors.blue[200],
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                onTap: _onItemTapped,
              ),
            );
        
      }
  }
