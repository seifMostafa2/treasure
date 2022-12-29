// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, deprecated_member_use, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:finology/Widgets/auto_size_text.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:animate_do/animate_do.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Constance/constance.dart';

import '../Monthly_Budgets/monthly_view.dart';

class HomeManage extends StatefulWidget {
  const HomeManage({Key? key}) : super(key: key);

  @override
  _HomeManageState createState() => _HomeManageState();
}

class _HomeManageState extends State<HomeManage> with TickerProviderStateMixin {
  String isSelected = "";
  late int defaultChoiceIndex;

  @override
  void initState() {
    super.initState();
    transactionList.length;
    monthlyBudgetsList.length;
    monthlySubscriptionsList.length;
    defaultChoiceIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  final dataMap = <String, double>{
    "Grocery": 3,
    "Health & Wellness": 3,
    "Home Rent": 3,
    "Vehicle": 3,
    "Entertainment": 3,
  };

  final List<AccountSpending> _spendingsList = <AccountSpending>[
    const AccountSpending('Grocery', 'GY', Color(0xfffbb927)),
    const AccountSpending('Health & Wellness', 'HW', Color(0xff54d59c)),
    const AccountSpending('Home Rent', 'HR', Color(0xff2fc6ff)),
    const AccountSpending('Vehicle', 'VC', Color(0xff9026fa)),
    const AccountSpending('Entertainment', 'EM', Color(0xff2149f8)),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(255, 202, 24, 1),
      const Color.fromRGBO(255, 202, 24, 1),
    ],
    [
      const Color.fromRGBO(88, 212, 158, 1),
      const Color.fromRGBO(88, 212, 158, 1),
    ],
    [
      const Color.fromRGBO(147, 38, 253, 1.0),
      const Color.fromRGBO(147, 38, 253, 1.0),
    ],
    [
      const Color.fromRGBO(47, 197, 255, 1.0),
      const Color.fromRGBO(47, 197, 255, 1.0),
    ],
    [
      const Color.fromRGBO(37, 78, 255, 1.0),
      const Color.fromRGBO(37, 78, 255, 1.0),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQueryHeight / 70,
                right: MediaQueryWidth / 30,
                left: MediaQueryWidth / 30,
                bottom: MediaQueryHeight / 40),
            child: Row(
              children: [
                const CircleAvatar(radius: 23),
                const SizedBox(width: defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("مرحبا", style: TextTheme.bodyText1),
                    Text("سيف",
                        style: TextTheme.headline5!.copyWith(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
            width: double.infinity,
            height: 400,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQueryWidth / 30,
                      left: MediaQueryWidth / 30,
                      bottom: 40),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(ConstanceData.blueChart))),
                  // child: Image.asset(ConstanceData.blueChart),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQueryWidth / 30 + 30,
                                left: MediaQueryWidth / 30 + 30),
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: ColorTheme.backgroundColor,
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.10, 10.0),
                                      blurRadius: 13)
                                ]),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQueryWidth / 30 + 30,
                                left: MediaQueryWidth / 30 + 30),
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: ColorTheme.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorTheme.backgroundColor
                                          .withOpacity(0.3),
                                      offset: const Offset(0.10, -3.0),
                                      blurRadius: 13)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'المدخلات',
                                        style: TextTheme.headline1!.copyWith(
                                            fontSize: 12, color: greenColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('+\$120',
                                              style: TextTheme.headline1!
                                                  .copyWith(color: greenColor)),
                                          const RotatedBox(
                                              quarterTurns: 3,
                                              child: Icon(
                                                  Icons.compare_arrows_rounded,
                                                  size: 20,
                                                  color: greenColor))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                    color: ColorTheme.dividerColor, width: 0),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'النفقات',
                                        style: TextTheme.headline1!.copyWith(
                                            fontSize: 12, color: redColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '-\$120',
                                            style: TextTheme.headline1!
                                                .copyWith(color: redColor),
                                          ),
                                          const RotatedBox(
                                              quarterTurns: 3,
                                              child: Icon(
                                                  Icons.compare_arrows_rounded,
                                                  size: 20,
                                                  color: redColor))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                    color: ColorTheme.dividerColor, width: 0),
                                /*Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SHIFT',
                                        style: TextTheme.headline1!.copyWith(
                                            fontSize: 12, color: blueColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '\$120',
                                            style: TextTheme.headline1!
                                                .copyWith(color: blueColor),
                                          ),
                                          const RotatedBox(
                                              quarterTurns: 3,
                                              child: Icon(
                                                  Icons.compare_arrows_rounded,
                                                  size: 20,
                                                  color: blueColor))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: defaultPadding,
                right: MediaQueryWidth / 30,
                left: MediaQueryWidth / 30,
                bottom: MediaQueryHeight / 40),
            child: Row(
              children: [
                Text("العمليات الماليه", style: TextTheme.headline5),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 4),
                      child: Text("26/09/21",
                          style: TextTheme.headline5!.copyWith(fontSize: 13)),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 240,
              margin: EdgeInsets.only(
                  bottom: MediaQueryHeight / 40,
                  left: MediaQueryWidth / 30,
                  right: MediaQueryWidth / 30),
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  color: ColorTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                  boxShadow: [
                    BoxShadow(
                        color: ColorTheme.disabledColor,
                        blurRadius: 15,
                        spreadRadius: 2),
                  ]),
              child: transactionList.length != null &&
                      transactionList.isNotEmpty
                  ? ListView.separated(
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
                  : const Center(child: CircularProgressIndicator())),
   /*       Padding(
              padding: EdgeInsets.only(
                  top: defaultPadding - 5,
                  right: MediaQueryWidth / 30,
                  left: MediaQueryWidth / 30,
                  bottom: MediaQueryHeight / 40),
              child: Text("Monthly Budgets", style: TextTheme.headline5)),
          Container(
            height: 190,
            color: ColorTheme.scaffoldBackgroundColor,
            margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
            child: ListView.builder(
              padding: EdgeInsets.only(left: MediaQueryWidth / 30),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Container(
                    width: MediaQueryWidth / 1.3,
                    padding: const EdgeInsets.all(defaultPadding),
                    margin: const EdgeInsets.only(
                        right: defaultPadding, top: 5, left: 3, bottom: 5),
                    decoration: BoxDecoration(
                      color: ColorTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      boxShadow: [
                        BoxShadow(
                            color: ColorTheme.disabledColor,
                            blurRadius: 5,
                            spreadRadius: 2),
                      ],
                    ),
                    child: monthlyBudgetsList.length != null &&
                            monthlyBudgetsList.isNotEmpty
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      margin: const EdgeInsets.only(
                                          right: defaultPadding),
                                      decoration: BoxDecoration(
                                          color: monthlyBudgetsList[index]
                                              .iconColor,
                                          borderRadius: BorderRadius.circular(
                                              defaultRadius)),
                                      child: Center(
                                          child: Icon(
                                              monthlyBudgetsList[index].icon,
                                              color: Colors.white,
                                              size: 26))),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          monthlyBudgetsList[index]
                                              .name
                                              .toString(),
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "\$" +
                                              monthlyBudgetsList[index]
                                                  .budget
                                                  .toString() +
                                              "/month",
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 13)),
                                    ],
                                  ),
                                  const Spacer(),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 MonthlyBudgetView(
                                  //                   leftOut: monthlyBudgetsList[
                                  //                           index]
                                  //                       .leftOut,
                                  //                   budget: monthlyBudgetsList[
                                  //                           index]
                                  //                       .budget,
                                  //                   caption: monthlyBudgetsList[
                                  //                           index]
                                  //                       .caption,
                                  //                   name: monthlyBudgetsList[
                                  //                           index]
                                  //                       .name,
                                  //                   percent: monthlyBudgetsList[
                                  //                           index]
                                  //                       .percent,
                                  //                   bgColor: monthlyBudgetsList[
                                  //                           index]
                                  //                       .iconColor,
                                  //                 )));
                                  //   },
                                  //   child: CircleAvatar(
                                  //     radius: 13,
                                  //     backgroundColor:
                                  //         Theme.of(context).dividerColor,
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         const SizedBox(width: 2),
                                  //         Icon(
                                  //           Icons.arrow_forward_ios_rounded,
                                  //           size: 15,
                                  //           color: ColorTheme.iconTheme.color,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  SplashIcon(
                                    size: 16,
                                    padding: 10,
                                    color: ColorTheme.dividerColor,
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MonthlyBudgetView(
                                                    leftOut: monthlyBudgetsList[
                                                            index]
                                                        .leftOut,
                                                    budget: monthlyBudgetsList[
                                                            index]
                                                        .budget,
                                                    caption: monthlyBudgetsList[
                                                            index]
                                                        .caption,
                                                    name: monthlyBudgetsList[
                                                            index]
                                                        .name,
                                                    percent: monthlyBudgetsList[
                                                            index]
                                                        .percent,
                                                    bgColor: monthlyBudgetsList[
                                                            index]
                                                        .iconColor,
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: defaultPadding),
                              LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1800,
                                  lineHeight: 20,
                                  percent: monthlyBudgetsList[index]
                                          .percent
                                          .toDouble() /
                                      100,
                                  center: Row(
                                    children: [
                                      Text(
                                          monthlyBudgetsList[index]
                                                  .percent
                                                  .toString() +
                                              "%",
                                          style: TextTheme.headline1!.copyWith(
                                              fontSize: 13,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor:
                                      monthlyBudgetsList[index].iconColor,
                                  backgroundColor:
                                      Theme.of(context).dividerColor),
                              const Divider(height: defaultPadding * 2),
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 17,
                                      backgroundColor: ColorTheme.dividerColor,
                                      child: Center(
                                          child: Text(
                                              monthlyBudgetsList[index].emojis,
                                              style: const TextStyle(
                                                  fontSize: 16)))),
                                  const SizedBox(width: defaultPadding),
                                  Flexible(
                                    child: AutoSizeText(
                                        monthlyBudgetsList[index].caption,
                                        maxLines: 2,
                                        style: TextTheme.subtitle2!
                                            .copyWith(fontSize: 14)),
                                  )
                                ],
                              ),
                            ],
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQueryHeight / 40,
                left: MediaQueryWidth / 30,
                right: MediaQueryWidth / 30),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: ColorTheme.backgroundColor,
              borderRadius: BorderRadius.circular(defaultRadius),
              boxShadow: [
                BoxShadow(
                    color: ColorTheme.disabledColor,
                    blurRadius: 15,
                    spreadRadius: 2),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your Account Spendings",
                    style: ColorTheme.textTheme.headline5),
                const SizedBox(height: defaultPadding),
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: const Duration(milliseconds: 1000),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQueryWidth / 2.1,
                        initialAngleInDegree: -50,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 20,
                        legendOptions: const LegendOptions(
                            showLegends: false,
                            showLegendsInRow: false,
                            legendShape: BoxShape.circle,
                            legendPosition: LegendPosition.bottom,
                            legendTextStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValues: false,
                            showChartValueBackground: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: false,
                            decimalPlaces: 1),
                        gradientList: gradientList,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("\$5.2K",
                                style: ColorTheme.textTheme.headline5),
                            const SizedBox(height: 5),
                            Text("52 Transactions",
                                style:
                                    TextTheme.subtitle2!.copyWith(fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 9,
                  children: List.generate(_spendingsList.length, (index) {
                    return ChoiceChip(
                      backgroundColor: ColorTheme.backgroundColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: StadiumBorder(
                          side: BorderSide(color: _spendingsList[index].color)),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 1),
                      label: Text(_spendingsList[index].name,
                          style: TextStyle(
                              color: defaultChoiceIndex != index
                                  ? _spendingsList[index].color
                                  : Colors.white)),
                      selected: defaultChoiceIndex == index,
                      selectedColor: _spendingsList[index].color,
                      labelStyle: const TextStyle(color: Colors.white),
                      onSelected: (value) {
                        setState(() {
                          defaultChoiceIndex =
                              value ? index : defaultChoiceIndex;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: defaultPadding,
                    right: MediaQueryWidth / 30,
                    left: MediaQueryWidth / 30,
                    bottom: defaultPadding * 1.3),
                child: Row(
                  children: [
                    Text("Monthly Subscriptions", style: TextTheme.headline5),
                  ],
                ),
              ),
              Container(
                height: 210,
                color: ColorTheme.scaffoldBackgroundColor,
                margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: MediaQueryWidth / 30),
                  itemCount: monthlySubscriptionsList.length != null &&
                          monthlySubscriptionsList.isNotEmpty
                      ? monthlySubscriptionsList.length
                      : 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => Row(
                    children: [
                      Container(
                        width: 220,
                        padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 3,
                            left: defaultPadding * 1.5,
                            right: defaultPadding * 1.5),
                        margin: const EdgeInsets.only(
                            right: defaultPadding, top: 5, left: 3, bottom: 5),
                        decoration: BoxDecoration(
                          color: ColorTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                          boxShadow: [
                            BoxShadow(
                                color: ColorTheme.disabledColor,
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                        ),
                        child: monthlySubscriptionsList.length != null &&
                                monthlySubscriptionsList.isNotEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundColor: Colors.grey[200],
                                    child: Center(
                                      child: BounceInDown(
                                        child: Image.asset(
                                          monthlySubscriptionsList[index].logo,
                                          height: 28,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding - 5),
                                  Text(monthlySubscriptionsList[index].name,
                                      style: TextTheme.headline5!
                                          .copyWith(fontSize: 18)),
                                  const SizedBox(height: defaultPadding - 5),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Next Payment on ',
                                      style: TextTheme.subtitle2!
                                          .copyWith(fontSize: 14),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                monthlySubscriptionsList[index]
                                                    .date,
                                            style: TextTheme.subtitle2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: redColor)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding),
                                  SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Center(
                                              child: Text(
                                            "Pay Now \$" +
                                                monthlySubscriptionsList[index]
                                                    .price,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )))),
                                ],
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}

class AccountSpending {
  const AccountSpending(this.name, this.initials, this.color);
  final String name;
  final String initials;
  final Color color;
}
