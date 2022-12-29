// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, prefer_const_constructors, prefer_adjacent_string_concatenation, deprecated_member_use, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeInvest extends StatefulWidget {
  const HomeInvest({Key? key}) : super(key: key);

  @override
  _HomeInvestState createState() => _HomeInvestState();
}

class _HomeInvestState extends State<HomeInvest> {
  bool checkValue = false;
  late int defaultChoiceIndex;

  @override
  void initState() {
    super.initState();
    investCardList.length;
    portfolioList.length;
    transactionList.length;
    topGainersDataList.length;
    topLosersDataList.length;
    defaultChoiceIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  final dataMap = <String, double>{
    "Mutul Funds": 3,
    "Direct Equities": 3,
    "Debt Funds": 3,
    "ELSS": 3,
    "Hybrid Funds": 3,
  };
  final List<FundsDistibutions> _fundsDistibutionsList = <FundsDistibutions>[
    const FundsDistibutions('Mutul Funds', 'MF', Color(0xfffbb927)),
    const FundsDistibutions('Direct Equities', 'DE', Color(0xff54d59c)),
    const FundsDistibutions('Debt Funds', 'DF', Color(0xff2fc6ff)),
    const FundsDistibutions('ELSS', 'EL', Color(0xff9026fa)),
    const FundsDistibutions('Hybrid Funds', 'HF', Color(0xff2149f8)),
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
      body:Center(child: Text("Soon"))
      /*ListView(
          padding: EdgeInsets.only(
              top: MediaQueryHeight / 70,
              bottom:
                  MediaQuery.of(context).padding.bottom + defaultPadding * 3),
          children: [
            Container(
              height: 200,
              color: ColorTheme.scaffoldBackgroundColor,
              margin: const EdgeInsets.only(bottom: defaultPadding),
              child: ListView.builder(
                padding: EdgeInsets.only(left: MediaQueryWidth / 30),
                itemCount:
                    investCardList.length != null && investCardList.isNotEmpty
                        ? investCardList.length
                        : 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Container(
                      width: MediaQueryWidth / 1.3,
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 1.5,
                          horizontal: defaultPadding * 1.8),
                      margin: const EdgeInsets.only(
                          right: defaultPadding, top: 5, left: 3, bottom: 5),
                      decoration: BoxDecoration(
                        color: ColorTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(investCardList[index].bgImage)),
                        boxShadow: [
                          BoxShadow(
                              color: ColorTheme.disabledColor,
                              blurRadius: 5,
                              spreadRadius: 2),
                        ],
                      ),
                      child: investCardList.length != null &&
                              investCardList.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText(
                                            investCardList[index].caption,
                                            maxLines: 6,
                                            maxFontSize: 19,
                                            minFontSize: 10,
                                            style:
                                                TextTheme.headline5!.copyWith(
                                                    // fontSize: 19,
                                                    wordSpacing: 1,
                                                    color: Colors.white)),
                                        Row(
                                          children: [
                                            AutoSizeText("See How ",
                                                maxLines: 1,
                                                maxFontSize: 16,
                                                minFontSize: 8,
                                                style: TextTheme.headline5!
                                                    .copyWith(
                                                        // fontSize: 17,
                                                        color: blueColor)),
                                            const SizedBox(width: 5),
                                            const Icon(Icons.arrow_forward,
                                                color: blueColor)
                                          ],
                                        )
                                      ],
                                    )),
                                const Flexible(flex: 2, child: SizedBox()),
                              ],
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQueryHeight / 40,
                  horizontal: MediaQueryWidth / 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Portfolio Value",
                      style: TextTheme.subtitle2!.copyWith(fontSize: 14)),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("\$15,254.37",
                          style: TextTheme.headline5!.copyWith(fontSize: 33))),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius:
                                BorderRadius.circular(defaultRadius * 2),
                          ),
                          child: Text("+3.75%",
                              style: TextTheme.headline5!.copyWith(
                                  color: Colors.white, fontSize: 15))),
                      Padding(
                          padding: const EdgeInsets.only(left: 3, right: 7),
                          child: Text("\$1245.32",
                              style:
                                  TextTheme.headline5!.copyWith(fontSize: 18))),
                      Text("Returns",
                          style: TextTheme.subtitle2!.copyWith(fontSize: 14)),
                    ],
                  ),
                  Container(
                    // height: 300,
                    margin: EdgeInsets.symmetric(
                        vertical: defaultPadding, horizontal: 0),
                    child: Center(child: Lottie.asset(ConstanceData.chartJson)),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(defaultPadding),
              itemCount: portfolioList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.91,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding),
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  padding:
                      EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
                  height: 250,
                  decoration: BoxDecoration(
                    color: ColorTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                    boxShadow: [
                      BoxShadow(
                          color: ColorTheme.disabledColor,
                          blurRadius: 10,
                          spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 23,
                          backgroundColor:
                              portfolioList[index].color.withOpacity(0.2),
                          child: Center(
                              child: Image.asset(portfolioList[index].bgImage,
                                  height: 30,
                                  color: portfolioList[index].color,
                                  fit: BoxFit.cover))),
                      SizedBox(height: 5),
                      Text(portfolioList[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: TextTheme.headline5!.copyWith(fontSize: 16)),
                      Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 5),
                          child: Text(
                              portfolioList[index].caption.toUpperCase(),
                              style:
                                  TextTheme.subtitle2!.copyWith(fontSize: 13))),
                      Text("\$" + portfolioList[index].price,
                          overflow: TextOverflow.ellipsis,
                          style: TextTheme.headline5!.copyWith(fontSize: 18)),
                      Container(
                          margin: const EdgeInsets.only(right: 5, top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius * 2)),
                          child: Text(portfolioList[index].parentage,
                              overflow: TextOverflow.ellipsis,
                              style: TextTheme.headline5!.copyWith(
                                  color: Colors.white, fontSize: 15))),
                    ],
                  ),
                );
              },
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                    defaultPadding, 0, defaultPadding, defaultPadding - 5),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryHeight / 40,
                    vertical: defaultPadding - 5),
                decoration: BoxDecoration(
                    color: ColorTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                    boxShadow: [
                      BoxShadow(
                          color: ColorTheme.disabledColor,
                          blurRadius: 15,
                          spreadRadius: 2),
                    ]),
                child: portfolioList.length != null && portfolioList.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Market Indices",
                                  style: TextTheme.headline5),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultRadius * 2),
                                                side: BorderSide(
                                                    color: blueColor))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorTheme.backgroundColor)),
                                    child: Text("All Stocks",
                                        style: TextTheme.headline5!.copyWith(
                                            color: blueColor, fontSize: 12))),
                              ),
                            ],
                          ),
                          SizedBox(height: defaultPadding - 5),
                          Column(
                            children:
                                List.generate(portfolioList.length, (index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 22,
                                          backgroundColor:
                                              blueColor.withOpacity(0.2),
                                          child: Center(
                                              child: Image.asset(
                                                  portfolioList[index].bgImage,
                                                  height: 30,
                                                  color: blueColor,
                                                  fit: BoxFit.cover))),
                                      SizedBox(width: defaultPadding),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                portfolioList[index]
                                                    .title
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextTheme.headline5!
                                                    .copyWith(fontSize: 16)),
                                            const SizedBox(height: 5),
                                            Text(portfolioList[index].caption,
                                                style: TextTheme.subtitle2!
                                                    .copyWith(fontSize: 13)),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                "\$" +
                                                    portfolioList[index].price,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextTheme.headline5!
                                                    .copyWith(fontSize: 16)),
                                            const SizedBox(height: 5),
                                            Text(portfolioList[index].parentage,
                                                style: TextTheme.subtitle2!
                                                    .copyWith(
                                                        fontSize: 13,
                                                        color: greenColor)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (index != 1)
                                    SizedBox(height: defaultPadding)
                                ],
                              );
                            }),
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator())),
            Padding(
                padding: EdgeInsets.only(
                    top: defaultPadding,
                    right: MediaQueryWidth / 30,
                    left: MediaQueryWidth / 30,
                    bottom: MediaQueryHeight / 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Top Gainers", style: TextTheme.headline5),
                      ],
                    ),
                    SizedBox(height: defaultPadding * 1.3),
                    Container(
                        decoration: BoxDecoration(
                            color: ColorTheme.backgroundColor,
                            borderRadius: BorderRadius.circular(defaultRadius),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorTheme.disabledColor,
                                  blurRadius: 15,
                                  spreadRadius: 2),
                            ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(defaultPadding * 1.2),
                                decoration: BoxDecoration(
                                    color: ColorTheme.backgroundColor,
                                    border: Border(
                                        left: BorderSide(
                                            color: greenColor, width: 3.0))),
                                child: topLosersDataList.length != null &&
                                        topLosersDataList.isNotEmpty
                                    ? Column(
                                        children: List.generate(
                                          topLosersDataList.length,
                                          (index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              topGainersDataList[
                                                                      index]
                                                                  .title
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextTheme
                                                                  .headline5!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16)),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                              topGainersDataList[
                                                                      index]
                                                                  .caption,
                                                              style: TextTheme
                                                                  .subtitle2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13)),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              "\$" +
                                                                  topGainersDataList[
                                                                          index]
                                                                      .price,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextTheme
                                                                  .headline5!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16)),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                              topGainersDataList[
                                                                      index]
                                                                  .parentage,
                                                              style: TextTheme
                                                                  .subtitle2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13,
                                                                      color:
                                                                          greenColor)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (index != 2)
                                                  Divider(
                                                      height:
                                                          defaultPadding * 1.7)
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator())))),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  right: MediaQueryWidth / 30,
                  left: MediaQueryWidth / 30,
                  bottom: MediaQueryHeight / 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Top Losers", style: TextTheme.headline5),
                    ],
                  ),
                  SizedBox(height: defaultPadding * 1.3),
                  Container(
                      decoration: BoxDecoration(
                          color: ColorTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                          boxShadow: [
                            BoxShadow(
                                color: ColorTheme.disabledColor,
                                blurRadius: 15,
                                spreadRadius: 2),
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(defaultPadding * 1.2),
                              decoration: BoxDecoration(
                                  color: ColorTheme.backgroundColor,
                                  border: Border(
                                      left: BorderSide(
                                          color: redColor, width: 3.0))),
                              child: topLosersDataList.length != null &&
                                      topLosersDataList.isNotEmpty
                                  ? Column(
                                      children: List.generate(
                                        topLosersDataList.length,
                                        (index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    fit: FlexFit.tight,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            topLosersDataList[
                                                                    index]
                                                                .title
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextTheme
                                                                .headline5!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16)),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                            topLosersDataList[
                                                                    index]
                                                                .caption,
                                                            style: TextTheme
                                                                .subtitle2!
                                                                .copyWith(
                                                                    fontSize:
                                                                        13)),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    fit: FlexFit.tight,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                            "\$" +
                                                                topLosersDataList[
                                                                        index]
                                                                    .price,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextTheme
                                                                .headline5!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16)),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                            topLosersDataList[
                                                                    index]
                                                                .parentage,
                                                            style: TextTheme
                                                                .subtitle2!
                                                                .copyWith(
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        redColor)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (index != 2)
                                                Divider(
                                                    height:
                                                        defaultPadding * 1.7)
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator())))),
                ],
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
                  Text("Funds Distibutions",
                      style: ColorTheme.textTheme.headline5),
                  const SizedBox(height: defaultPadding * 1.5),
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        PieChart(
                            dataMap: dataMap,
                            animationDuration:
                                const Duration(milliseconds: 1000),
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
                            gradientList: gradientList),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("\$15.2K",
                                  style: ColorTheme.textTheme.headline5),
                              const SizedBox(height: 5),
                              Text("5 Type of Funds",
                                  style: TextTheme.subtitle2!
                                      .copyWith(fontSize: 12))
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
                    children:
                        List.generate(_fundsDistibutionsList.length, (index) {
                      return ChoiceChip(
                        backgroundColor: ColorTheme.backgroundColor,
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: _fundsDistibutionsList[index].color)),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 1),
                        label: Text(_fundsDistibutionsList[index].name,
                            style: TextStyle(
                                color: defaultChoiceIndex != index
                                    ? _fundsDistibutionsList[index].color
                                    : Colors.white)),
                        selected: defaultChoiceIndex == index,
                        selectedColor: _fundsDistibutionsList[index].color,
                        labelStyle: const TextStyle(color: Colors.white),
                        onSelected: (value) {
                          setState(() {
                            defaultChoiceIndex =
                                value ? index : defaultChoiceIndex;
                          });
                        },
                        // backgroundColor: color,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQueryWidth / 30),
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
                children: [
                  Row(
                    children: [
                      Text("Mutul Fund Details", style: TextTheme.headline5),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, defaultPadding, 0, defaultPadding),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme
                          ? Color(0xfffdf5de)
                          : Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("SBI Flexicap Fund-Gr".toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Inv. amt",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("7,99,960".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Units",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("98.51".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Abs. Ret.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("12.94" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Cur. Val.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("1,071.40".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Holding",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("9.09" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ann. Ret",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("35.41" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: defaultPadding * 1.5),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme
                          ? Color(0xffdee5ff)
                          : Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Parag Parikhi Cap Fund-Reg Gr".toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Inv. amt",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("7,99,960".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Units",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("98.51".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Abs. Ret.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("12.94" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Cur. Val.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("1,071.40".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Holding",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("9.09" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ann. Ret",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("35.41" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Total", style: TextTheme.headline5),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, defaultPadding, 0, defaultPadding - 5),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: ColorTheme.backgroundColor,
                      border: Border.all(color: ColorTheme.dividerColor),
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Parag Parikhi Cap Fund-Reg Gr".toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Inv. amt",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("7,99,960".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Units",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("98.51".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Abs. Ret.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("12.94" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Div P.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("0.002".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Cur. Val.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("1,071.40".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Holding",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("9.09" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ann. Ret",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.subtitle2!
                                              .copyWith(fontSize: 12)),
                                      Text("35.41" + "%".toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.headline5!
                                              .copyWith(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Prortfolio Weighted Avg. Abs. Returns: 11.79% National Gain (/Loss): \$8,000",
                          style: TextTheme.subtitle2!.copyWith(fontSize: 12)),
                      SizedBox(height: defaultPadding),
                      Text(
                          "Note: Annualized Return is calculated on Ads. basis for (1 Yr & on XIRR basis for) = 1 Yr.",
                          style: TextTheme.subtitle2!.copyWith(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
          ]),*/
    );
  }
}

class FundsDistibutions {
  const FundsDistibutions(this.name, this.initials, this.color);
  final String name;
  final String initials;
  final Color color;
}
