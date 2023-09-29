import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

var turns = 0.0;

class _SebhaTapState extends State<SebhaTap> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
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
                      pro.modeApp == ThemeMode.light
                          ? "assets/images/head_sebha_logo.png"
                          : "assets/images/head_sebha_dark.png",
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
                  pro.modeApp == ThemeMode.light
                      ? "assets/images/body_sebha_logo.png"
                      : "assets/images/body_sebha_dark.png",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.of(context)!.tasbehNumber,
              style: pro.modeApp == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 81,
                width: 69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: pro.modeApp == ThemeMode.light
                        ? MyThemeData.accentColor
                        : MyThemeData.darkPrimaryColor),
                child: Center(
                    child: Text(
                  "$counter",
                  style: pro.modeApp == ThemeMode.light
                      ? Theme.of(context).textTheme.bodyLarge
                      : Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                ))),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    color: pro.modeApp == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.yellowColor),
                child: Text(
                  tsbeh[index],
                  style: pro.modeApp == ThemeMode.light
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: const Color(0xffffffff))
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyThemeData.darkPrimaryColor),
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
