

Future<UIResponseModel?> getData() async {
  UIResponseModel? result;
  var buttonItemList = [
    ButtonData(title: 'chat', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(title: 'size', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(title: 'share', value: ButtonItem(title: null, iconURL: '')),
    ButtonData(
        title: 'pickAnimal',
        value: ButtonItem(title: 'Pick Animal', iconURL: '')),
    ButtonData(
        title: 'tabHome',
        value: ButtonItem(title: 'Animal Board', iconURL: '')),
    ButtonData(title: 'tabBlog', value: ButtonItem(title: 'Blog', iconURL: '')),
    ButtonData(
        title: 'tabCommunity',
        value: ButtonItem(title: 'Community', iconURL: '')),
    ButtonData(
        title: 'tabZoo',
        value: ButtonItem(title: 'Zoo Consultant', iconURL: '')),
    ButtonData(title: 'tabMore', value: ButtonItem(title: 'More', iconURL: '')),
  ];

  TextTheme textTheme = TextTheme(
    animalImageUrl: '',
    headerTitle: 'Animal Board',
    headerSubtitle: 'Your animal choices',
    animalBoardTitle: 'Your Animal Square',
    animalBoardSubtitle: 'for last month',
    animalName: 'Penguins',
  );
  result = UIResponseModel(buttonDetail: buttonItemList, textTheme: textTheme);

  return result;
}

class UIResponseModel {
  final List<ButtonData> buttonDetail;
  final TextTheme textTheme;
  UIResponseModel({required this.buttonDetail, required this.textTheme});
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
  final String? animalImageUrl;
  final String? headerTitle;
  final String? headerSubtitle;
  final String? animalBoardTitle;
  final String? animalBoardSubtitle;
  final String animalName;
  TextTheme({
    this.animalImageUrl,
    this.headerTitle,
    this.headerSubtitle,
    this.animalBoardTitle,
    this.animalBoardSubtitle,
    required this.animalName,
  });
}
