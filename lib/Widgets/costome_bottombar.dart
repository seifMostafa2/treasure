// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_this, use_key_in_widget_constructors, deprecated_member_use, unused_import, non_constant_identifier_names, unused_local_variable, unused_element, library_private_types_in_public_api

import 'dart:developer';
import 'package:animations/animations.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Home/Accounts/account.dart';
import 'package:finology/Home/Monthly_Budgets/monthly_budgets.dart';
import 'package:finology/Home/Wallet/wallet.dart';
import 'package:finology/Home/transactions_screen.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../Home/Dashbord/dashbord_tab.dart';
import 'circular_menu.dart';
import 'common_button.dart';
import 'drawer_widget.dart';

bool status = AppTheme.isLightTheme ? false : true;
int currentIndex = 0;
List<Widget> currentPage = [
  Home(),
  AccountScreen(),
  MonthlyBudgets(),
  WalletScreen(),
];

class CostomeBottomBar extends StatefulWidget {
  @override
  _CostomeBottomBarState createState() => _CostomeBottomBarState();
}

class _CostomeBottomBarState extends State<CostomeBottomBar> {
  DownBottomSheet DownSheet = DownBottomSheet();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          //Navigator.pop(context);
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
        return true;
      },
      child: Scaffold(
          body: PageTransitionSwitcher(
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: currentPage[currentIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Theme.of(context).disabledColor)
              ],
            ),
            height: MediaQuery.of(context).padding.bottom + 55,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() => currentIndex = 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 0
                                  ? FontAwesomeIcons.solidListAlt
                                  : FontAwesomeIcons.listAlt,
                              color: currentIndex == 0
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 23),
                          SizedBox(height: 5),
                          Text("لوحة القيادة",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 0
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () => setState(() => currentIndex = 1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 1
                                  ? Icons.account_balance_rounded
                                  : Icons.account_balance_outlined,
                              color: currentIndex == 1
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 24),
                          SizedBox(height: 3),
                          Text("حسابى",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 1
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(width: defaultPadding * 3),
                  /*InkWell(
                    onTap: () => setState(() => currentIndex = 2),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         *//* Icon(
                              currentIndex == 2
                                  ? FontAwesomeIcons.solidCompass
                                  : FontAwesomeIcons.compass,
                              color: currentIndex == 2
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 23),
                          SizedBox(height: 5),*//*
                          *//*Text("Budgets",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 2
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),*//*
                        ],
                      ),
                    ),
                  ),*/
                  /*InkWell(
                    onTap: () => setState(() => currentIndex = 3),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 3
                                  ? Icons.account_balance_wallet_rounded
                                  : Icons.account_balance_wallet_outlined,
                              color: currentIndex == 3
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 24),
                          SizedBox(height: 5),
                          Text("Wallet",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 3
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: blueColor,
            onPressed: () {  },

          )
        /*CircularMenu(
            blurColor: Theme.of(context).disabledColor,
            toggleButtonStartIcon: Icon(Icons.add, color: Colors.white),

            curve: Curves.easeOut,
            toggleButtonStartColor: greenColor,
            blurOpacity: 1,
            toggleButtonSize: 15,
            toggleButtonMargin: 30,
            items: [
              CircularMenuItem(color: Colors.transparent, onTap: () {}),
              CircularMenuItem(
                  buttonSize: 19,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ConstanceData.upAndDownArrow,
                          height: 15, color: blueColor),
                      SizedBox(height: 5),
                      Text(
                        "SHIFT",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 10),
                      )
                    ],
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(
                  buttonSize: 19,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_downward, color: redColor),
                      Text(
                        "SPENT",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 10),
                      )
                    ],
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  onTap: () {
                    setState(() {
                      DownSheet.downBottomSheet(context);
                    });
                  }),
              CircularMenuItem(
                  buttonSize: 19,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_downward, color: greenColor),
                      Text("EARN",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 10))
                    ],
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(color: Colors.transparent, onTap: () {}),
            ],
          )*/),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        // child: PageStructure(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 || details.delta.dx < -6) {
            ZoomDrawer.of(context)!.toggle.call();
          }
        },
      ),
    );
  }
}

class DownBottomSheet {
  downBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.only(
                      top: defaultPadding * 1.5,
                      right: defaultPadding,
                      left: defaultPadding,
                      bottom: MediaQuery.of(context).padding.bottom +
                          defaultPadding),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(defaultRadius))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recurrence',
                          style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: defaultPadding * 1.5),
                      Row(
                        children: [
                          Expanded(
                            child: Text("Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 13)),
                          ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            child: Text("Category",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 13)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 55,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: defaultPadding),
                              padding: EdgeInsets.all(3.7),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                style: Theme.of(context).textTheme.headline1,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.all(defaultPadding / 2),
                                  border: InputBorder.none,
                                  hintText: "None",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontSize: 13),
                                  prefixIcon: Icon(Icons.money_rounded,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            child: categoryDropDown(
                              hintValue: 'Select Category',
                              list: ["Food", "Drink", "Food & Drink"],
                              context: context,
                            ),
                            /* Container(
                              height: 55,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: defaultPadding),
                              padding: EdgeInsets.all(3.7),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                style: Theme.of(context).textTheme.headline1,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.all(defaultPadding / 2),
                                  border: InputBorder.none,
                                  hintText: "empty",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontSize: 13),
                                ),
                              ),
                            ), */
                          ),
                        ],
                      ),
                      Text("Notes",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 13)),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: defaultPadding * 1.3),
                        padding: EdgeInsets.all(3.7),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        child: TextFormField(
                          maxLines: 5,
                          textAlignVertical: TextAlignVertical.center,
                          style: Theme.of(context).textTheme.headline1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(defaultPadding / 2),
                            border: InputBorder.none,
                            hintText: "...",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: OpenContainer(
                          transitionDuration: Duration(milliseconds: 600),
                          transitionType: ContainerTransitionType.fade,
                          openBuilder: (BuildContext context, VoidCallback _) {
                            return TransactionsScreen();
                          },
                          closedElevation: 0,
                          openColor: Theme.of(context).primaryColor,
                          closedColor: Theme.of(context).primaryColor,
                          closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(defaultRadius))),
                          closedBuilder: (BuildContext context,
                              VoidCallback openContainer) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)),
                              child: Center(
                                child: Text("Add Record",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 17, color: Colors.white)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Widget categoryDropDown(
      {required List<String> list,
      required String hintValue,
      required BuildContext context}) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(top: 10, bottom: defaultPadding),
      padding: EdgeInsets.all(3.7),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: DropdownButtonFormField<String>(
        dropdownColor: Theme.of(context).backgroundColor,
        style: Theme.of(context).textTheme.headline1,
        hint: Text(hintValue,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13)),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: defaultPadding, right: defaultPadding),
            hintStyle:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13),
            border: InputBorder.none),
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onChanged: (newValue) {
          assert(newValue != null);
        },
      ),
    );
  }
}
