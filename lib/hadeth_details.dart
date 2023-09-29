import 'package:flutter/material.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'myThemeData.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth details";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                pro.getBackground(),
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title,
              style: pro.modeApp == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          child: Card(
            elevation: 12,
            color: pro.modeApp == ThemeMode.light
                ? const Color.fromARGB(240, 255, 255, 255)
                : MyThemeData.darkPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: MyThemeData.primaryColor)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                      color: pro.modeApp == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.yellowColor,
                      thickness: 2,
                      endIndent: 30,
                      indent: 30),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(
                            textDirection: TextDirection.rtl,
                            style: pro.modeApp == ThemeMode.light
                                ? Theme.of(context).textTheme.bodySmall
                                : Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: MyThemeData.yellowColor),
                            textAlign: TextAlign.center,
                            args.content[index]));
                  },
                  itemCount: args.content.length),
            ),
          ),
        ),
      ),
    );
  }
}
