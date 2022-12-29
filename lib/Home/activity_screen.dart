// ignore_for_file: non_constant_identifier_names, unused_local_variable, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Widgets/auto_size_text.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: SplashIcon(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          size: 28,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(defaultPadding - 5, defaultPadding, defaultPadding, defaultPadding),
              child: Row(
                children: [
                  SplashIcon(
                    icon: Icon(Icons.notifications_none, color: Theme.of(context).iconTheme.color),
                    size: 28,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: defaultPadding - 5),
                  SplashIcon(onPressed: () {}, icon: Icon(Icons.more_vert_rounded, color: Theme.of(context).iconTheme.color), size: 28),
                ],
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding, left: defaultPadding, bottom: defaultPadding),
            child: Text("Activity", style: TextTheme.headline1!.copyWith(fontSize: 33, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, defaultPadding),
              children: [
                Container(
                  decoration: BoxDecoration(color: const Color(0xff1F9277), borderRadius: BorderRadius.circular(defaultRadius)),
                  margin: const EdgeInsets.symmetric(vertical: defaultPadding),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ALERT", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                          Text("24TH SEP 2021", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 1.5),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText("Your Account is On Hold",
                                      maxFontSize: 20, minFontSize: 18, style: TextTheme.headline1!.copyWith(color: Colors.white)),
                                  const SizedBox(height: 5),
                                  Text("You can no longer refresh your bank transactions. If you wish to continue please sync your HDFC wallet",
                                      style: TextTheme.subtitle2!.copyWith(fontSize: 13, wordSpacing: 0.7, color: Colors.white70)),
                                  const SizedBox(height: defaultPadding * 1.5),
                                  SizedBox(
                                    width: 130,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
                                        child: const Center(
                                            child: Text(
                                          "Connect Again",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ),
                                ],
                              )),
                          Expanded(
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    ConstanceData.bankLogo,
                                    height: 90,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(defaultRadius)),
                  margin: const EdgeInsets.only(bottom: defaultPadding, top: defaultPadding - 5),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("OFFER", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                          Text("17TH SEP 2021", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 1.5),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText("Cashback 20%",
                                      maxFontSize: 20, minFontSize: 18, style: TextTheme.headline1!.copyWith(color: Colors.white)),
                                  const SizedBox(height: 5),
                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: TextTheme.subtitle2!.copyWith(fontSize: 13, wordSpacing: 0.7, color: Colors.white70)),
                                  const SizedBox(height: defaultPadding * 1.5),
                                  SizedBox(
                                    width: 130,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
                                        child: const Center(
                                            child: Text(
                                          "Claim Now",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ),
                                ],
                              )),
                          Expanded(
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    ConstanceData.cashBack,
                                    height: 90,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: const Color(0xff7C4BC6), borderRadius: BorderRadius.circular(defaultRadius)),
                  margin: const EdgeInsets.only(bottom: defaultPadding, top: defaultPadding - 5),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("NOTIFICATION", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                          Text("15TH SEP 2021", style: TextTheme.subtitle2!.copyWith(fontSize: 13, color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 1.5),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText("Your payment of \$2182 was successful",
                                      maxFontSize: 20, minFontSize: 18, style: TextTheme.headline1!.copyWith(color: Colors.white)),
                                  const Divider(height: defaultPadding * 1.8, color: Colors.white30),
                                  Text("Towards", style: TextTheme.subtitle2!.copyWith(fontSize: 13, wordSpacing: 0.7, color: Colors.white70)),
                                  Text("HDFC XXXX 32....", style: TextTheme.headline1!.copyWith(fontSize: 18, wordSpacing: 0.7, color: Colors.white)),
                                ],
                              )),
                          Expanded(
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    ConstanceData.creditCard,
                                    height: 70,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
