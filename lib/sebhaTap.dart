import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                sebha();
              },
              child: Image.asset("assets/images/sebha.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tasbeh Number",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Container(
                height: 81,
                width: 69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyThemeData.primaryColor),
                child: Center(
                    child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.bodyLarge,
                ))),
            SizedBox(
              height: 20,
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
      }
      else if (index == 1 && counter == 33) {
        index = 2;
        counter = 0;
      }
      else if (index == 2 && counter == 33) {
        index = 3;
        counter = 0;
      }
      else if (index == 3 && counter == 33) {
        index = 4;
        counter = 0;
      } else if(index == 4 && counter == 33){
        index = 0;
        counter = 0;
      }
    });
  }
}
