Future<SchemaModel?> getData() async {
  SchemaModel? result;
  var buttonItemList = [
    ButtonData(title: 'chat', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(title: 'size', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(title: 'share', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(
        title: 'pickAnimal',
        value: ButtonItem(title: 'Pick Animal', iconURL: '')),
  ];
  var tabList = [
    ButtonData(
        title: 'tabHome',
        value: ButtonItem(title: 'Animal Board', iconURL: null)),
    ButtonData(
        title: 'tabBlog', value: ButtonItem(title: 'Blog', iconURL: null)),
    ButtonData(
        title: 'tabCommunity',
        value: ButtonItem(title: 'Community', iconURL: null)),
    ButtonData(
        title: 'tabZoo',
        value: ButtonItem(title: 'Zoo Consultant', iconURL: null)),
    ButtonData(
        title: 'tabMore', value: ButtonItem(title: 'More', iconURL: null)),
  ];
  TextTheme textTheme = TextTheme(
    imageUrl: '',
    headerTitle: 'Animal Board',
    headerSubtitle: 'Your animal choices',
    animalBoardTitle: 'Your Animal Square',
    animalBoardSubtitle: 'for last month',
    animalName: 'Penguins',
  );
  result = SchemaModel(
      buttonDetail: buttonItemList, textTheme: textTheme, tabDetail: tabList);

  return result;
}

class SchemaModel {
  final List<ButtonData> buttonDetail;
  final List<ButtonData> tabDetail;
  final TextTheme textTheme;
  SchemaModel(
      {required this.tabDetail,
      required this.buttonDetail,
      required this.textTheme});
}

class ButtonData {
  final String title;
  final ButtonItem value;
  ButtonData({required this.title, required this.value});
}

class ButtonItem {
  final String? title;
  final String? iconURL;
  ButtonItem({this.title, this.iconURL});
}

class TextData {
  final String title;
  final String value;
  TextData({required this.title, required this.value});
}

class TextTheme {
  final String? imageUrl;
  final String? headerTitle;
  final String? headerSubtitle;
  final String? animalBoardTitle;
  final String? animalBoardSubtitle;
  final String animalName;
  TextTheme({
    this.imageUrl,
    this.headerTitle,
    this.headerSubtitle,
    this.animalBoardTitle,
    this.animalBoardSubtitle,
    required this.animalName,
  });
}
