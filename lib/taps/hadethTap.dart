import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/hadeth_provider.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../hadeth_details.dart';
import '../myThemeData.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => HadethProvider()..loadHadeth(),
      builder: (context, child) {
        var provider = Provider.of<HadethProvider>(context);
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
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                  color: pro.modeApp == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40),
              itemCount: provider.allAhadeth.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadethDetails.routeName,
                        arguments: provider.allAhadeth[index]);
                  },
                  child: Text(
                      textAlign: TextAlign.center,
                      provider.allAhadeth[index].title,
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
      },
    );
  }
}
