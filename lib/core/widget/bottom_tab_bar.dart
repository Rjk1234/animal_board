import 'package:animal_board/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../schema/domain/model/model.dart';

class BottomTabBarWidget extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final List<TabBarItem> itemList;
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
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: (itemList[0].iconUrl != null)
                  ? networkIcon(itemList[0].iconUrl!)
                  : const Icon(Icons.home_outlined),
              label: itemList[0].title,
            ),
            BottomNavigationBarItem(
              icon: itemList[1].iconUrl != null
                  ? networkIcon(itemList[1].iconUrl!)
                  : const Icon(Icons.home_outlined),
              label: itemList[1].title,
            ),
            BottomNavigationBarItem(
              icon: itemList[2].iconUrl != null
                  ? networkIcon(itemList[2].iconUrl!)
                  : const Icon(Icons.home_outlined),
              label: itemList[2].title,
            ),
            BottomNavigationBarItem(
              icon: itemList[3].iconUrl != null
                  ? networkIcon(itemList[3].iconUrl!)
                  : const Icon(Icons.home_outlined),
              label: itemList[3].title,
            ),
            BottomNavigationBarItem(
              icon: itemList[4].iconUrl != null
                  ? networkIcon(itemList[4].iconUrl!)
                  : const Icon(Icons.home_outlined),
              label: itemList[4].title,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: kColorGrey,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 9.0,
          onTap: ((value) => onTap(value)),
        ),
      ),
    );
  }

  Image networkIcon(String url) {
    return Image.network(url, height: 15, width: 15);
  }
}
