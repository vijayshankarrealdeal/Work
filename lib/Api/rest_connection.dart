import 'dart:convert';

import 'package:Intern/model/jsonModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APi extends ChangeNotifier {
  bool isLoading = false;

  void toggle() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<ModelSegment> _modelSegmentFromJson(String str) =>
      List<ModelSegment>.from(
          json.decode(str).map((x) => ModelSegment.fromJson(x)));
  List<ModelSegment> _data = [];
  List<ModelSegment> get dataUser => [..._data];
  Future<void> getDataFrom(int limit) async {
    final url =
        "http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=$limit";

    final responseData = await http.get(url);
    print(1);
    toggle();
    print(2);
    if (responseData.statusCode == 200) {
      _data = _modelSegmentFromJson(responseData.body);
      print('called');
    } else {
      print(responseData.statusCode);
    }
    notifyListeners();
  }
}
