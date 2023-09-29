import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.eng,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.languageCode == "en"
                          ? MyThemeData.primaryColor
                          : Colors.black54),
                ),
                const Spacer(),
                pro.languageCode == "en"
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: pro.languageCode == "en"
                            ? MyThemeData.primaryColor
                            : Colors.black54,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pro.changeLanguage("ar");
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.arab,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: pro.languageCode == "ar"
                            ? MyThemeData.primaryColor
                            : Colors.black54)),
                const Spacer(),
                pro.languageCode == "en"
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.check,
                        size: 30,
                        color: pro.languageCode == "ar"
                            ? MyThemeData.primaryColor
                            : Colors.black54,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
