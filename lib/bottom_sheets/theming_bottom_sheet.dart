import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.modeApp == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : Colors.black54),
                ),
                Spacer(),
                pro.modeApp == ThemeMode.light
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: pro.modeApp == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : Colors.black54,
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: pro.modeApp == ThemeMode.dark
                            ? MyThemeData.yellowColor
                            : Colors.black54)),
                Spacer(),
                pro.modeApp == ThemeMode.light
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.check,
                        size: 30,
                        color: pro.modeApp == ThemeMode.dark
                            ? MyThemeData.yellowColor
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
