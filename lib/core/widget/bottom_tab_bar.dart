import 'package:animal_board/config/app_colors.dart';
import 'package:flutter/material.dart';

class BottomTabBarWidget extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final List itemList;
  const BottomTabBarWidget(
      {super.key,
      required this.onTap,
      required this.selectedIndex,
      required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: kBlackShadow, spreadRadius: 0, blurRadius: 10),
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
          backgroundColor: kWhiteColor,
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
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: kColorGrey,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 10.0,
          onTap: ((value) => onTap(value)),
        ),
      ),
    );
  }
}
