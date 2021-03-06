import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreditsScreen extends StatelessWidget {
  final PageController controller;

  const CreditsScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //Back Button & Heading
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    controller.animateToPage(0,
                        duration: Duration(milliseconds: 150),
                        curve: Curves.easeInOut);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.8,
                          )),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width > 360 ? 80 : 60),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: AutoSizeText(
                    "Credits",
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxFontSize: 21,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 70,
            child: Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: constraint.maxHeight * 0.31,
                      height: constraint.maxHeight * 0.31,
                      image: AssetImage("assets/corona_virus.png"),
                    ),
                    SizedBox(height: 20),
                    AutoSizeText(
                      "Covid Tracker",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxFontSize: 25,
                    ),
                    AutoSizeText(
                      "Version 1.0.0",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.5,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff009a88),
                      ),
                      maxFontSize: 18,
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 375,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: AutoSizeText(
                "Covid Tracker is an app made with Flutter framework to provide worldwide information related to Covid-19 pandemic. It shows the affected, recovered, deaths, tests and infection probability for each country.",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.4,
                  height: 1.6,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal,
                  color: Color(0xff008e7b),
                ),
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
