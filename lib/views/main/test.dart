import 'package:coindcx/constant/info.dart';
import 'package:coindcx/views/home/homepage.dart';
import 'package:coindcx/views/home/price.dart';
import 'package:coindcx/views/home/profile.dart';
import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  final String userName;
  final String userImage;
  const Testpage({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  @override
  void initState() {
    Apkdata.pname = widget.userName;
    Apkdata.temppimage = widget.userImage;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      Apkdata.selectedIndex = index;
      Apkdata.temppimage = Apkdata.pimage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: Apkdata.selectedIndex,
          children: [
            const MyHomePage(),
            Pricepage1(dataList: Apkdata.list[0]),
            const Profilepage(),
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
            label: 'Search',
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
