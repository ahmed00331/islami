import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text("إذاعة القرآن الكريم",
            style: pro.modeApp == ThemeMode.light
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: MyThemeData.blackColor)
                : Theme.of(context).textTheme.bodyMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.skip_previous,
                color: pro.modeApp == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.yellowColor,
                size: 50),
            Icon(Icons.play_arrow,
                color: pro.modeApp == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.yellowColor,
                size: 50),
            Icon(Icons.skip_next,
                color: pro.modeApp == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.yellowColor,
                size: 50),
          ],
        )
      ],
    );
  }
}
