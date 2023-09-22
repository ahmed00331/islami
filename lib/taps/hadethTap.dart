import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

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
    var pro = Provider.of<MyProvider>(context);
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }
    return Column(children: [
      Image.asset("assets/images/hadeth_logo.png"),
      Divider(
        color: pro.modeApp == ThemeMode.light
            ? MyThemeData.primaryColor
            : MyThemeData.yellowColor,
        thickness: 2,
      ),
      Text(AppLocalizations.of(context)!.ahadeth,
          style: pro.modeApp == ThemeMode.light
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyThemeData.blackColor)
              : Theme.of(context).textTheme.bodyMedium),
      Divider(
        color: pro.modeApp == ThemeMode.light
            ? MyThemeData.primaryColor
            : MyThemeData.yellowColor,
        thickness: 2,
      ),
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
              color: pro.modeApp == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
              thickness: 2,
              indent: 40,
              endIndent: 40),
          itemCount: allAhadeth.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                    arguments: allAhadeth[index]);
              },
              child: Text(
                  textAlign: TextAlign.center,
                  allAhadeth[index].title,
                  style: pro.modeApp == ThemeMode.light
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyThemeData.blackColor)
                      : Theme.of(context).textTheme.bodyMedium),
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
