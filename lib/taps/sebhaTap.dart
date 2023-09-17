import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

var turns = 0.0;

class _SebhaTapState extends State<SebhaTap> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Transform.rotate(
              angle: 5.6,
              child: Container(
                height: 105,
                width: 79,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                    image: AssetImage(
                      "assets/images/head_sebha_logo.png",
                    ),
                  ),
                ),
              ),
            ),
            AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  sebha();
                  setState(() {
                    turns += 1 / 33;
                  });
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/body_sebha_logo.png",
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.of(context)!.tasbehNumber,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 81,
                width: 69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyThemeData.accentColor),
                child: Center(
                    child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.bodyLarge,
                ))),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    color: MyThemeData.primaryColor),
                child: Text(
                  tsbeh[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
          ],
        ),
      ),
    );
  }

  int counter = 0;
  int index = 0;

  List<String> tsbeh = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لا حول ولا قوة الا بالله",
    "لا إله إلا الله"
  ];

  void sebha() {
    setState(() {
      counter++;
      if (index == 0 && counter == 33) {
        index = 1;
        counter = 0;
      } else if (index == 1 && counter == 33) {
        index = 2;
        counter = 0;
      } else if (index == 2 && counter == 33) {
        index = 3;
        counter = 0;
      } else if (index == 3 && counter == 33) {
        index = 4;
        counter = 0;
      } else if (index == 4 && counter == 33) {
        index = 0;
        counter = 0;
      }
    });
  }
}
