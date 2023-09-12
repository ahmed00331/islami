import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as SuraModel;
    if (verses.isEmpty){loadFile(args.index);}


    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name, style: Theme
                .of(context)
                .textTheme
                .bodyLarge),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 10),
            child: Card(
              elevation: 12,
              color: Color.fromARGB(240, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),side: BorderSide(color: MyThemeData.primaryColor)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: MyThemeData.primaryColor,
                  thickness: 2,endIndent: 30,indent: 30),
                    itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.blackColor),
                        textAlign: TextAlign.center,
                          "${verses[index]}(${index+1})"));
                },
                    itemCount: verses.length),
              ),
            ),
          ),
        ));
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = file.split("\n");

    verses = lines;
    setState(() {

    });
  }
}
