import 'package:flutter/material.dart';
import 'package:islami/hadeth_model.dart';

import 'myThemeData.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth details";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                args.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            child: Card(
              elevation: 12,
              color: const Color.fromARGB(240, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: MyThemeData.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.primaryColor,
                        thickness: 2,
                        endIndent: 30,
                        indent: 30),
                    itemBuilder: (context, index) {
                      return Center(
                          child: Text(
                              textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodySmall,
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
