import '../../../data/api_client.dart';
import 'package:flutter/material.dart';

class SchemaProvider with ChangeNotifier {
  UIResponseModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getData())!;
    loading = false;

    notifyListeners();
  }
}
