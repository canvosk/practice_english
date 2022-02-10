import 'package:flutter/material.dart';
import 'package:practice_english/ui/components/style.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);
  final String goTestTitle = "Kelime Çöz";
  final String goTestSubTitle =
      "Karışık bir şekilde karşınıza ingilizce kelimeler çıkarır";
  final String goListTitle = "Kelimeleri Listele";
  final String goListSubTitle =
      "Çözmüş olduğunuz tüm kelimeleri türkçeleriyle birlikte listeler";
  final String goFavTitle = "Favorilerimi Listele";
  final String goFavSubTitle =
      "Favori olarak eklediğiniz ingilizce kelimeler listelenir";
  final testPageRoute = "/test-page";
  final listPageRoute = "/list-page";
  final favPageRoute = "/fav-page";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buttonContainer(
            context,
            goTestTitle,
            goTestSubTitle,
            testPageRoute,
            redToPurpleGradient,
          ),
          buttonContainer(
            context,
            goListTitle,
            goListSubTitle,
            listPageRoute,
            yellowToOrangeGradient,
          ),
          buttonContainer(
            context,
            goFavTitle,
            goFavSubTitle,
            favPageRoute,
            blueToBlueGradient,
          ),
        ],
      ),
    );
  }

  Container buttonContainer(BuildContext context, String title, String subTitle,
      String route, BoxDecoration gradient) {
    return Container(
      height: 100,
      alignment: Alignment.centerLeft,
      decoration: gradient,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          title,
          style: mainPageText,
        ),
        subtitle: Text(
          subTitle,
          style: mainPageSub,
        ),
      ),
    );
  }
}
