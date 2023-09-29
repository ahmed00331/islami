import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myThemeData.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/suraDetailes.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

class QuranTap extends StatelessWidget {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/qur2an_screen_logo.png"),
          Divider(
            color: pro.modeApp == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.yellowColor,
            thickness: 2,
          ),
          Text(AppLocalizations.of(context)!.suraNames,
              style: pro.modeApp == ThemeMode.light
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyThemeData.blackColor)
                  : Theme.of(context).textTheme.bodyMedium),
          Divider(
            color: pro.modeApp == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.yellowColor,
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: pro.modeApp == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.yellowColor,
                indent: 40,
                endIndent: 40,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                          arguments: SuraModel(suraName[index], index)
                      );
                    },
                    child: Text(
                      suraName[index],
                      textAlign: TextAlign.center,
                      style: pro.modeApp == ThemeMode.light
                          ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyThemeData.blackColor)
                          : Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              itemCount: suraName.length,
            ),
          ),
        ],
      ),
    );
  }
}
