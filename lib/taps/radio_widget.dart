import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/radioModel.dart';
import '../myThemeData.dart';
import '../providers/my_provider.dart';

class RadioWidget extends StatefulWidget {
  final RadioData radioData;

  const RadioWidget({required this.radioData, super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.radioData.name!,
              style: pro.modeApp == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyThemeData.blackColor)
                  : Theme.of(context).textTheme.bodyMedium),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    audioPlayer.play(UrlSource(widget.radioData.url!));
                  });
                },
                child: Icon(Icons.play_arrow,
                    color: pro.modeApp == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.yellowColor,
                    size: 50),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    audioPlayer.pause();
                  });
                },
                child: Icon(Icons.pause,
                    color: pro.modeApp == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.yellowColor,
                    size: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
