import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_model.dart';

import 'hadeth_details.dart';
import 'myThemeData.dart';

class HadethTap extends StatelessWidget {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {

    loadHadeth();
    return SingleChildScrollView(
      child: Column(
          children: [
        Image.asset("assets/images/hadeth_logo.png"),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 2,
        ),
        Text("Ahadeth",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color(0xff242424))),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 2,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
              color: MyThemeData.primaryColor,
              thickness: 2,
              indent: 40,
              endIndent: 40),
          itemCount: allAhadeth.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                  arguments: allAhadeth[index]
                );
              },
              child: Text(
                allAhadeth[index].title,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            );
          },
        )
      ]),
    );
  }

  void loadHadeth() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
