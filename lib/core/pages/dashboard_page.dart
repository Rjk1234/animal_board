import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../feature/blog/presentation/blog_page.dart';
import '../../feature/community/presentation/community_page.dart';
import '../../feature/more/presentation/more_page.dart';
import '../../feature/zoo_consultant/presentation/zoo_consultant_page.dart';
import '../schema/domain/model/model.dart';
import '../widget/bottom_tab_bar.dart';
import '../schema/application/schema_provider.dart';
import '../../feature/animalBoard/presentation/pages/animal_board_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
    TabBarItem(id: 0, title: 'AnimalBoard'),
    TabBarItem(id: 1, title: 'Blog'),
    TabBarItem(id: 2, title: 'Community'),
    TabBarItem(id: 3, title: 'Zoo Consultant'),
    TabBarItem(id: 4, title: 'More')
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

  void _buildTabBarItemList(SchemaProvider model) {
    if (model.post != null) {
      tabItemList.clear();
      for (int i = 0; i < model.post!.tabDetail.length; i++) {
        var item = model.post!.tabDetail[i];
        tabItemList.add(
          TabBarItem(
              id: i, title: item.value.title!, iconUrl: item.value.iconURL),
        );
      }
    }
  }

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
