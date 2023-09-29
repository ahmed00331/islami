import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/language_botoom_sheet.dart';
import '../bottom_sheets/theming_bottom_sheet.dart';

class SettingTap extends StatefulWidget {
  const SettingTap({super.key});

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.lang),
          InkWell(
            onTap: () {
              languageBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text(pro.languageCode == "en"
                  ? AppLocalizations.of(context)!.eng
                  : AppLocalizations.of(context)!.arab),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              themingBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.primaryColor),
              ),
              child: Text(pro.modeApp == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark),
            ),
          ),
        ],
      ),
    );
  }

  languageBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  themingBottomSheet() {
    showModalBottomSheet(
      context: context,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            borderSide: BorderSide(color: Colors.transparent)),
        builder: (context) => ThemingBottomSheet());
  }
}
