import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hadeth_model.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  void loadHadeth() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = ahadeth.split("#");
    for (int i = 0; i < ahadethList.length; i++) {
      String hadethOne = ahadethList[i];
      List<String> hadethOneLines = hadethOne.trim().split("\n");
      String title = hadethOneLines[0];
      hadethOneLines.removeAt(0);
      List<String> content = hadethOneLines;
      HadethModel hadethModel = HadethModel(title, content);
      allAhadeth.add(hadethModel);
      notifyListeners();
    }
  }
}
