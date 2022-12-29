// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, prefer_final_fields, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:finology/Constance/constance.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bank_account.dart';
import 'credit_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  SharedAxisTransitionType? _transitionType =
      SharedAxisTransitionType.horizontal;
  AddAccountBottomSheet AddAccountSheet = AddAccountBottomSheet();

  ConnectedAccounts objConnectedAccounts = ConnectedAccounts();

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat("###.0#", "en_US");
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                Text("Connected",
                    style: TextTheme.headline1!.copyWith(fontSize: 19)),
                Spacer(),
                AppBarIcons(),
              ],
            ),
            Row(
              children: [
               /* Text("Accounts",
                    style: TextTheme.headline1!
                        .copyWith(fontSize: 33, fontWeight: FontWeight.bold)),*/
                /*Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defaultPadding - 5, 0, 0, defaultPadding),
                  child: SplashIcon(
                    padding: 14,
                    color: Colors.lightBlue,
                    icon: Icon(Icons.add),
                    iconColor: Colors.white,
                    onPressed: () {
                      AddAccountSheet.addAccountSheet(context);
                    },
                  ),
                ),*/
              ],
            ),
          ],
        ),
      ),
      Expanded(
          child: ListView(
              padding: EdgeInsets.fromLTRB(0, defaultPadding, 0,
                  MediaQuery.of(context).padding.bottom + defaultPadding * 2.5),
              children: [
            Container(
              height: 180,
              margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
              color: ColorTheme.scaffoldBackgroundColor,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: MediaQueryWidth / 30),
                itemCount: connectedAccountsList.length != null &&
                        connectedAccountsList.isNotEmpty
                    ? connectedAccountsList.length
                    : 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    if (index == 0)
                      Container(
                        margin: const EdgeInsets.only(
                            right: defaultPadding, top: 5, left: 3, bottom: 5),
                        width: 180 / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          boxShadow: [
                            BoxShadow(
                                color: ColorTheme.disabledColor,
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(defaultRadius),
                            color: Theme.of(context).backgroundColor,
                            child: InkWell(
                              onTap: () {
                                AddAccountSheet.addAccountSheet(context);
                              },
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              child: Center(
                                  child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.add,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          Text("ADD ACCOUNTS" "  ",
                                              style: TextTheme.bodyText2!
                                                  .copyWith(fontSize: 12)),
                                        ],
                                      ))),
                            )),
                      ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          border: Border.all(
                              color: connectedAccountsList[index].selected
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
                            right: defaultPadding, top: 5, left: 3, bottom: 5),
                        width: 170,
                        child: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.circular(defaultRadius),
                            color: Theme.of(context).backgroundColor,
                            child: InkWell(
                                onTap: () {
                                  RecurrencButtonSelected(index);

                                  setState(() {});
                                },
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 3,
                                        left: defaultPadding * 1.5,
                                        right: defaultPadding * 1.5),
                                    child: connectedAccountsList.length !=
                                                null &&
                                            connectedAccountsList.isNotEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                  radius: 23,
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  child: Center(
                                                      child: BounceInDown(
                                                          child: Image.asset(
                                                              connectedAccountsList[
                                                                      index]
                                                                  .logo
                                                                  .toString(),
                                                              height: 28,
                                                              fit: BoxFit
                                                                  .scaleDown)))),
                                              const SizedBox(
                                                  height: defaultPadding + 5),
                                              Text(
                                                  connectedAccountsList[index]
                                                      .type
                                                      .toString(),
                                                  style: TextTheme.subtitle2!
                                                      .copyWith(fontSize: 12)),
                                              const SizedBox(
                                                  height: defaultPadding - 3),
                                              Text(
                                                  NumberFormat.currency(
                                                          locale: 'haw',
                                                          decimalDigits: 2,
                                                          customPattern:
                                                              "\$" '#,###.##')
                                                      .format(
                                                          connectedAccountsList[
                                                                  index]
                                                              .balance),
                                                  style: TextTheme.headline5),
                                            ],
                                          )
                                        : const Center(
                                            child:
                                                CircularProgressIndicator()))))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(

                children: [
                  Text("العمليات الماليه", style: TextTheme.headline5),
                  //SizedBox(height: defaultPadding),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 290,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: transactionList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: defaultPadding * 2),
                        itemBuilder: (BuildContext context, int index) => Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 50,
                                    width: 50,
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding),
                                    decoration: BoxDecoration(
                                        color: transactionList[index]
                                            .iconColor!
                                            .withOpacity(0.2),
                                        borderRadius:
                                        BorderRadius.circular(defaultRadius)),
                                    child: Center(
                                        child: Icon(transactionList[index].icon,
                                            color:
                                            transactionList[index].iconColor,
                                            size: 26))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(transactionList[index].name.toString(),
                                        style: TextTheme.headline5!
                                            .copyWith(fontSize: 16)),
                                    const SizedBox(height: 5),
                                    Text("24/08/21",
                                        style: TextTheme.subtitle2!
                                            .copyWith(fontSize: 13)),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                    transactionList[index].upToDown
                                        ? "-\$" +
                                        transactionList[index]
                                            .price
                                            .toString()
                                        : "+\$" +
                                        transactionList[index]
                                            .price
                                            .toString(),
                                    // userData.price.toString(),
                                    style: TextTheme.headline5!.copyWith(
                                        fontSize: 16,
                                        color: transactionList[index].upToDown
                                            ? redColor
                                            : greenColor)),
                                RotatedBox(
                                  quarterTurns:
                                  transactionList[index].upToDown ? 1 : 3,
                                  child: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: transactionList[index].upToDown
                                        ? redColor
                                        : greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                          )
                    ),
                  ),
                ],
              ),
            ),
          ])),
    ]));
  }

  Widget axisTransaction(BuildContext context, TextTheme TextTheme) {
    return transactionList.length != null && transactionList.isNotEmpty
        ? Column(
            children: List.generate(
              transactionList.length,
              (index) {
                return Column(
                  children: [
                    if (index % 2 == 0)
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0, defaultPadding + 7, 0, defaultPadding),
                          child: Row(
                            children: [
                              Text('27 Sep 2021',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 13, color: Colors.grey)),
                            ],
                          )),
                    Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            margin:
                                const EdgeInsets.only(right: defaultPadding),
                            decoration: BoxDecoration(
                                color: transactionList[index]
                                    .iconColor!
                                    .withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Center(
                                child: Icon(transactionList[index].icon,
                                    color: transactionList[index].iconColor,
                                    size: 26))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactionList[index].name.toString(),
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text("7:00 PM",
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                          ],
                        ),
                        const Spacer(),
                        Text(
                            transactionList[index].upToDown
                                ? "-\$" +
                                    transactionList[index].price.toString()
                                : "+\$" +
                                    transactionList[index].price.toString(),
                            style: TextTheme.headline5!.copyWith(
                                fontSize: 16,
                                color: transactionList[index].upToDown
                                    ? redColor
                                    : greenColor)),
                        RotatedBox(
                          quarterTurns: transactionList[index].upToDown ? 1 : 3,
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            color: transactionList[index].upToDown
                                ? redColor
                                : greenColor,
                          ),
                        ),
                      ],
                    ),
                    if (index % 2 == 0) SizedBox(height: defaultPadding)
                  ],
                );
              },
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }

  Widget hdfcTransaction(BuildContext context) {
    return transactionList.length != null && transactionList.isNotEmpty
        ? Center(child: Text("No Transactions"))
        : const Center(child: CircularProgressIndicator());
  }

  Widget sbiTransaction(BuildContext context, TextTheme TextTheme) {
    return transactionList.length != null && transactionList.isNotEmpty
        ? Column(
            children: List.generate(
              1,
              (index) {
                return Column(
                  children: [
                    if (index % 2 == 0)
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0, defaultPadding + 7, 0, defaultPadding),
                          child: Row(
                            children: [
                              Text('27 Sep 2021',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 13, color: Colors.grey)),
                            ],
                          )),
                    Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            margin:
                                const EdgeInsets.only(right: defaultPadding),
                            decoration: BoxDecoration(
                                color: transactionList[2]
                                    .iconColor!
                                    .withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Center(
                                child: Icon(transactionList[2].icon,
                                    color: transactionList[2].iconColor,
                                    size: 26))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactionList[2].name.toString(),
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text("7:00 PM",
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                          ],
                        ),
                        const Spacer(),
                        Text(
                            transactionList[2].upToDown
                                ? "-\$" + transactionList[2].price.toString()
                                : "+\$" + transactionList[2].price.toString(),
                            style: TextTheme.headline5!.copyWith(
                                fontSize: 16,
                                color: transactionList[2].upToDown
                                    ? redColor
                                    : greenColor)),
                        RotatedBox(
                          quarterTurns: transactionList[2].upToDown ? 1 : 3,
                          child: Icon(
                            Icons.arrow_right_alt_rounded,
                            color: transactionList[2].upToDown
                                ? redColor
                                : greenColor,
                          ),
                        ),
                      ],
                    ),
                    if (index % 2 == 0) SizedBox(height: defaultPadding)
                  ],
                );
              },
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }

  void RecurrencButtonSelected(int index) {
    /* SingleSlectedItem */
    for (int i = 0; i < connectedAccountsList.length; i++) {
      if (i == index) {
        connectedAccountsList[i].selected = true;
      } else {
        connectedAccountsList[i].selected = false;
      }
    }
    /* MultipleSelect */
    // connectedAccountsList[index].selected = !connectedAccountsList[index].selected;
    connectedAccountsList[index].transactionindex = index;
    objConnectedAccounts = connectedAccountsList[index];
  }
}

enum BoxValues { boxSelected }

class AddAccountBottomSheet {
  addAccountSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              color: Color.fromRGBO(0, 0, 0, 0.001),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(defaultRadius))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, defaultPadding, 0,
                        MediaQuery.of(context).padding.bottom + defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * 1.5),
                          child: Text('Account Type',
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        SizedBox(height: defaultPadding * 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.4,
                              height: 120,
                              child: OpenContainer(
                                  transitionDuration:
                                      Duration(milliseconds: 600),
                                  transitionType: ContainerTransitionType.fade,
                                  openBuilder:
                                      (BuildContext context, VoidCallback _) {
                                    return BankAccount();
                                  },
                                  closedElevation: 0,
                                  openColor: Theme.of(context).backgroundColor,
                                  closedColor:
                                      Theme.of(context).backgroundColor,
                                  closedShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(defaultRadius))),
                                  closedBuilder: (BuildContext context,
                                      VoidCallback openContainer) {
                                    return Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              margin: const EdgeInsets.only(
                                                  right: defaultPadding),
                                              decoration: BoxDecoration(
                                                  color: blueColor
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultRadius)),
                                              child: Center(
                                                  child: Icon(
                                                      Icons
                                                          .account_balance_outlined,
                                                      color: blueColor,
                                                      size: 30))),
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "Bank Account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 25),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.4,
                              height: 120,
                              // margin: EdgeInsets.only(top: 10, bottom: 0),
                              child: OpenContainer(
                                  transitionDuration:
                                      Duration(milliseconds: 600),
                                  transitionType: ContainerTransitionType.fade,
                                  openBuilder:
                                      (BuildContext context, VoidCallback _) {
                                    return CreditCardScreen(
                                        width:
                                            MediaQuery.of(context).size.width);
                                  },
                                  closedElevation: 0,
                                  openColor: blueColor,
                                  closedColor: blueColor,
                                  closedShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(defaultRadius))),
                                  closedBuilder: (BuildContext context,
                                      VoidCallback openContainer) {
                                    return Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              margin: const EdgeInsets.only(
                                                  right: defaultPadding),
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultRadius)),
                                              child: Center(
                                                  child: Icon(Icons.credit_card,
                                                      color: Colors.white,
                                                      size: 30))),
                                          SizedBox(height: defaultPadding),
                                          Text("Credit Card",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      fontSize: 18,
                                                      color: Colors.white))
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }));
        });
  }
}
