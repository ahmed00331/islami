import 'package:flutter/material.dart';
import 'package:islami/myThemeData.dart';

class SettingTap extends StatefulWidget {
  const SettingTap({super.key});

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language"),
          InkWell(
            onTap: () {
              languageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text("English"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Theme"),
          InkWell(
            onTap: () {
              themingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text("Light"),
            ),
          ),
        ],
      ),
    );
  }

  languageBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * .2,
      ),
    );
  }

  themingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * .2,
      ),
    );
  }
}
