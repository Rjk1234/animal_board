import 'package:flutter/material.dart';

class BottomTabBarWidget extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final List itemList;
  const BottomTabBarWidget(
      {super.key,
      required this.onTap,
      required this.selectedIndex,
      required this.itemList});

  @override
  State<BottomTabBarWidget> createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<BottomTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //add background color
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'AnimalBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Zoo Consultant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'More',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 10.0,
          onTap: ((value) => widget.onTap(value)),
        ),
      ),
    );
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
}
