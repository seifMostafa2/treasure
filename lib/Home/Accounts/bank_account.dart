// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/auto_size_text.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  @override
  Widget build(BuildContext context) {
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                defaultPadding, 0, defaultPadding, defaultPadding - 3),
            color:
                AppTheme.isLightTheme ? const Color(0xff121315) : Colors.black,
            height: AppBar().preferredSize.height +
                MediaQuery.of(context).padding.top +
                defaultPadding * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SplashIcon(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  size: 27,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text("Add Your Frist Account",
                    style: TextTheme.headline1!
                        .copyWith(color: Colors.white, fontSize: 20)),
                const SizedBox(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: AppBar().preferredSize.height +
                    MediaQuery.of(context).padding.top +
                    defaultPadding),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(defaultRadius)),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorTheme.scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(defaultRadius))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: defaultPadding),
                              child: Text("Account Name",
                                  style: TextTheme.subtitle2!
                                      .copyWith(fontSize: 13))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: defaultPadding,
                                bottom: 5,
                                left: defaultPadding,
                                right: defaultPadding),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextTheme.headline1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorTheme.backgroundColor,
                                  hintText: "Savings Account",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                      borderSide: BorderSide(
                                          color: ColorTheme.primaryColor,
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                      borderSide: BorderSide(
                                          color: ColorTheme.dividerColor,
                                          width: 1)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding,
                                      vertical: defaultPadding * 1.4),
                                  hintStyle: TextTheme.subtitle2!
                                      .copyWith(fontSize: 16),
                                  suffixIcon: const Icon(Icons.edit_outlined)),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          Container(
                            height: 160,
                            margin:
                                EdgeInsets.only(bottom: MediaQueryHeight / 40),
                            color: ColorTheme.scaffoldBackgroundColor,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQueryWidth / 30),
                              itemCount: newBanksList.length != null &&
                                      newBanksList.isNotEmpty
                                  ? newBanksList.length
                                  : 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                      border: Border.all(
                                          color: newBanksList[index].selected
                                              ? blueColor
                                              : Colors.transparent,
                                          width: 1.5),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorTheme.disabledColor,
                                            blurRadius: 5,
                                            spreadRadius: 2),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding,
                                        top: 5,
                                        left: 3,
                                        bottom: 5),
                                    width: 170,
                                    child: Material(
                                      elevation: 0,
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                      color: ColorTheme.backgroundColor,
                                      child: InkWell(
                                        onTap: () {
                                          newBankListSelected(index);
                                          setState(() {});
                                        },
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 3,
                                              left: defaultPadding * 1.5,
                                              right: defaultPadding * 1.5),
                                          child: newBanksList.length != null &&
                                                  newBanksList.isNotEmpty
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                        radius: 23,
                                                        backgroundColor:
                                                            Colors.grey[200],
                                                        child: Center(
                                                            child: BounceInDown(
                                                                child: Image.asset(
                                                                    newBanksList[
                                                                            index]
                                                                        .logo
                                                                        .toString(),
                                                                    height: 28,
                                                                    fit: BoxFit
                                                                        .scaleDown)))),
                                                    const SizedBox(
                                                        height:
                                                            defaultPadding + 5),
                                                    AutoSizeText(
                                                        newBanksList[index]
                                                            .name
                                                            .toString(),
                                                        maxLines: 1,
                                                        maxFontSize: 18,
                                                        minFontSize: 15,
                                                        style: TextTheme
                                                            .headline5!
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Text("Username",
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: defaultPadding,
                                bottom: defaultPadding * 1.5,
                                left: defaultPadding,
                                right: defaultPadding),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextTheme.headline1,
                              decoration: InputDecoration(
                                hintText: "Enter Username",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                    borderSide: BorderSide(
                                        color: ColorTheme.primaryColor,
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                    borderSide: BorderSide(
                                        color: ColorTheme.dividerColor,
                                        width: 1)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding,
                                    vertical: defaultPadding * 1.4),
                                hintStyle:
                                    TextTheme.subtitle2!.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Text("Password",
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: defaultPadding,
                                // bottom: defaultPadding * 1.5,
                                bottom: 0,
                                left: defaultPadding,
                                right: defaultPadding),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextTheme.headline1,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                    borderSide: BorderSide(
                                        color: ColorTheme.primaryColor,
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                    borderSide: BorderSide(
                                        color: ColorTheme.dividerColor,
                                        width: 1)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding,
                                    vertical: defaultPadding * 1.4),
                                hintStyle:
                                    TextTheme.subtitle2!.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                      ConstanceData.securityScanningJson,
                                      height: 90)
                                ],
                              ),
                              Container(
                                height: 80,
                                padding: const EdgeInsets.fromLTRB(
                                    defaultPadding,
                                    defaultPadding * 2,
                                    defaultPadding,
                                    defaultPadding),
                                margin: const EdgeInsets.fromLTRB(
                                    defaultPadding,
                                    defaultPadding * 2.7,
                                    defaultPadding,
                                    defaultPadding),
                                decoration: BoxDecoration(
                                    color: ColorTheme.dividerColor
                                        .withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.circular(defaultPadding)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: const [
                                        Text("dff"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: CustomButton(
                              text: "Connect Account",
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void newBankListSelected(int index) {
  /* SingleSlectedItem */
  for (int i = 0; i < newBanksList.length; i++) {
    if (i == index) {
      newBanksList[i].selected = true;
    } else {
      newBanksList[i].selected = false;
    }
  }
  /* MultipleSelect */
  // newBanksList[index].selected = !newBanksList[index].selected;
}
