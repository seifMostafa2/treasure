// ignore_for_file: non_constant_identifier_names, unused_local_variable, unnecessary_null_comparison, prefer_const_constructors, library_private_types_in_public_api
import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Controller/userdetail_controller.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/auto_size_text.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var cardBackground = AppTheme.isLightTheme
        ? Theme.of(context).backgroundColor
        : Colors.black;
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          AppTheme.isLightTheme ? const Color(0xff121315) : Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                defaultPadding,
                MediaQuery.of(context).padding.top + defaultPadding,
                defaultPadding,
                0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("My",
                        style: TextTheme.headline1!
                            .copyWith(fontSize: 19, color: Colors.white)),
                    const Spacer(),
                    AppBarIcons(
                      iconColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Wallet",
                        style: TextTheme.headline1!.copyWith(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultPadding - 5, 0, 0, defaultPadding),
                      child: SplashIcon(
                        padding: 14,
                        color: Colors.lightBlue,
                        icon: const Icon(Icons.add),
                        iconColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  height: 160,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            bottom: 55 / 2,
                            left: defaultPadding * 2,
                            right: defaultPadding * 2),
                        padding:
                            const EdgeInsets.only(top: defaultPadding * 1.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          color: AppTheme.isLightTheme
                              ? Colors.black45
                              : Theme.of(context).backgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("TOTAL BALANCE",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 13,
                                        color: const Color(0xffA6B09D))),
                            const SizedBox(height: defaultPadding - 10),
                            Text(AllData.myBalance,
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 45, color: greenColor))
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * 5),
                          child: CustomButton(
                            text: "New Payment",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 15, color: Colors.white),
                            icon: Icons.add_circle,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: defaultPadding * 2),
              // padding: const EdgeInsets.only(top: defaultPadding),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(defaultRadius * 1.5))),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(defaultRadius * 1.5)),
                child: ListView(
                  // padding: EdgeInsets.fromLTRB(0, defaultPadding, 0,
                  //     MediaQuery.of(context).padding.bottom + 0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                defaultPadding + 5,
                                defaultPadding + 5,
                                defaultPadding,
                                defaultPadding - 5),
                            child: Text("Recent", style: TextTheme.headline5)),
                        Container(
                          height: 120,
                          margin:
                              EdgeInsets.only(bottom: MediaQueryHeight / 40),
                          color: ColorTheme.scaffoldBackgroundColor,
                          child: GetX<UserController>(builder: (cntrlr) {
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              itemCount: cntrlr.lstFaces.isNotEmpty ? 8 : 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                children: [
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorTheme.disabledColor
                                                .withOpacity(0.1),
                                            blurRadius: 5,
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding,
                                        top: 5,
                                        left: 3,
                                        bottom: 5),
                                    child: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(
                                          defaultRadius + 3),
                                      color: ColorTheme.backgroundColor,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius + 3),
                                        child: cntrlr.lstFaces.length != null &&
                                                cntrlr.lstFaces.isNotEmpty
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: 70,
                                                      width: double.infinity,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white10,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  cntrlr
                                                                      .lstFaces[
                                                                          index]
                                                                      .urls![2]
                                                                      .s128
                                                                      .toString())),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  defaultRadius -
                                                                      3))),
                                                  AutoSizeText(
                                                      myWalletRecentList[index]
                                                          .name
                                                          .toString(),
                                                      maxLines: 1,
                                                      maxFontSize: 12,
                                                      minFontSize: 11,
                                                      style: TextTheme
                                                          .subtitle2!
                                                          .copyWith()),
                                                ],
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                defaultPadding + 5,
                                0,
                                defaultPadding,
                                defaultPadding),
                            child: Text("Transfer Money",
                                style: TextTheme.headline5)),
                        Container(
                          height: 120,
                          margin:
                              EdgeInsets.only(bottom: MediaQueryHeight / 40),
                          color: ColorTheme.scaffoldBackgroundColor,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            itemCount: transferMoneytList.isNotEmpty
                                ? transferMoneytList.length
                                : 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                              children: [
                                Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                  ),
                                  margin: const EdgeInsets.only(
                                      right: 8, top: 5, left: 3, bottom: 5),
                                  child: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(
                                        defaultRadius + 3),
                                    color: AppTheme.isLightTheme
                                        ? transferMoneytList[index]
                                            .iconColor
                                            .withOpacity(0.2)
                                        : Theme.of(context)
                                            .backgroundColor
                                            .withOpacity(0.7),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {});
                                      },
                                      borderRadius: BorderRadius.circular(
                                          defaultRadius + 3),
                                      child: transferMoneytList.length !=
                                                  null &&
                                              transferMoneytList.isNotEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                    radius: 24,
                                                    backgroundColor:
                                                        AppTheme.isLightTheme
                                                            ? transferMoneytList[
                                                                    index]
                                                                .iconColor
                                                            : Theme.of(context)
                                                                .scaffoldBackgroundColor,
                                                    child: Icon(
                                                        transferMoneytList[
                                                                index]
                                                            .icon,
                                                        size: 27,
                                                        color: AppTheme
                                                                .isLightTheme
                                                            ? Colors.white
                                                            : transferMoneytList[
                                                                    index]
                                                                .iconColor)),
                                                const SizedBox(
                                                    height: defaultPadding - 7),
                                                AutoSizeText(
                                                    transferMoneytList[index]
                                                        .name
                                                        .toString(),
                                                    maxLines: 1,
                                                    maxFontSize: 13,
                                                    minFontSize: 11,
                                                    style: TextTheme.headline1!
                                                        .copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color)),
                                              ],
                                            )
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // padding: const EdgeInsets.only(
                          //     bottom: defaultPadding,
                          //     left: defaultPadding,
                          //     right: defaultPadding,
                          //     top: defaultPadding * 1.5),
                          margin: EdgeInsets.fromLTRB(
                              defaultPadding,
                              defaultPadding,
                              defaultPadding,
                              MediaQuery.of(context).padding.bottom +
                                  defaultPadding * 2.5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: ColorTheme.disabledColor,
                                    blurRadius: 8,
                                    spreadRadius: 2),
                              ],
                              color: Theme.of(context).backgroundColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: defaultPadding,
                                      top: defaultPadding),
                                  child: Text("Categories",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5)),
                              GridView.builder(
                                  padding: const EdgeInsets.only(
                                      bottom: defaultPadding,
                                      left: 0,
                                      right: 0,
                                      top: defaultPadding * 1.5),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          mainAxisSpacing: defaultPadding - 5,
                                          crossAxisSpacing: defaultPadding - 5),
                                  itemCount: walletCategoriesList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 26,
                                            backgroundColor:
                                                walletCategoriesList[index]
                                                    .iconColor
                                                    .withOpacity(0.2),
                                            child: Icon(
                                                walletCategoriesList[index]
                                                    .icon,
                                                size: 30,
                                                color:
                                                    walletCategoriesList[index]
                                                        .iconColor)),
                                        const SizedBox(height: 5),
                                        Text(walletCategoriesList[index].name,
                                            style: TextTheme.headline1!
                                                .copyWith(fontSize: 13)),
                                      ],
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
