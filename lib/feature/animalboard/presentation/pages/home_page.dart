import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/model.dart';
import '../../../../core/widget/bottom_tab_bar.dart';
import '../../application/schema_provider.dart';
import 'animal_board_page.dart';
import 'blog_page.dart';
import 'community_page.dart';
import 'more_page.dart';
import 'zoo_consultant_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final _pages = [
    const AnimalBoardPage(),
    const BlogPage(),
    const CommunityPage(),
    const ZooConsultantPage(),
    const MorePage()
  ];
  var tabItemListFromServer = [];
  final tabItemList = [
    TabBarItem(
        buttonId: 0,
        buttonIcon: Icons.home_outlined,
        buttonTitle: 'AnimalBoard'),
    TabBarItem(
        buttonId: 1, buttonIcon: Icons.home_outlined, buttonTitle: 'Blog'),
    TabBarItem(
        buttonId: 2, buttonIcon: Icons.home_outlined, buttonTitle: 'Community'),
    TabBarItem(
        buttonId: 3,
        buttonIcon: Icons.home_outlined,
        buttonTitle: 'Zoo Consultant'),
    TabBarItem(
        buttonId: 4, buttonIcon: Icons.home_outlined, buttonTitle: 'More')
  ];
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<SchemaProvider>(context, listen: false);
    postModel.getPostData();
  }

  void _onTabBarItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _buildTabBarItemList(SchemaProvider model) {}

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<SchemaProvider>(context);
    _buildTabBarItemList(uiModel);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomTabBarWidget(
        selectedIndex: pageIndex,
        onTap: ((index) => _onTabBarItemTapped(index)),
        itemList: tabItemList,
      ),
      body: _pages[pageIndex],
    );
  }
}
