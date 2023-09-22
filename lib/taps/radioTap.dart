import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text("إذاعة القرآن الكريم",style: Theme.of(context).textTheme.bodyLarge),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.skip_previous,
                color: MyThemeData.primaryColor, size: 50),
            Icon(Icons.play_arrow, color: MyThemeData.primaryColor, size: 50),
            Icon(Icons.skip_next, color: MyThemeData.primaryColor, size: 50),
          ],
        )
      ],
    );
  }
}
