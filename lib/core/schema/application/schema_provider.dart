import 'package:flutter/material.dart';

import '../data/api_client.dart';

class SchemaProvider with ChangeNotifier {
  SchemaModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getData())!;
    loading = false;

    notifyListeners();
  }
}
