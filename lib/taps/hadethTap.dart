import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth_model.dart';

import '../hadeth_details.dart';
import '../myThemeData.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }
    return Column(children: [
      Image.asset("assets/images/hadeth_logo.png"),
      Divider(
        color: MyThemeData.primaryColor,
        thickness: 2,
      ),
      Text(AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Color(0xff242424))),
      Divider(
        color: MyThemeData.primaryColor,
        thickness: 2,
      ),
      Expanded(
        child: ListView.separated(
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          )
        ]);
  }

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
    }
    setState(() {});
  }
}
