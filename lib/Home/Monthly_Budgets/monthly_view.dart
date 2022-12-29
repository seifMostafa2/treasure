// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, prefer_adjacent_string_concatenation, unnecessary_null_comparison, prefer_final_fields, prefer_typing_uninitialized_variables, deprecated_member_use, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MonthlyBudgetView extends StatefulWidget {
  final String? budget, name, caption, leftOut;
  final int? percent;
  final Color? bgColor;

  const MonthlyBudgetView(
      {Key? key,
      this.budget,
      this.name,
      this.caption,
      this.percent,
      this.leftOut,
      this.bgColor})
      : super(key: key);

  @override
  _MonthlyBudgetViewState createState() => _MonthlyBudgetViewState();
}

class _MonthlyBudgetViewState extends State<MonthlyBudgetView> {
  late ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          debugPrint("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          debugPrint("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var ThemeData = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: CustomScrollView(
            controller: _hideButtonController,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  splashRadius: Material.defaultSplashRadius / 1.7,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(widget.name.toString() + " Budget",
                    style: TextTheme.headline1!.copyWith(color: Colors.white)),
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                defaultPadding * 4),
                        decoration: BoxDecoration(
                            color: AppTheme.isLightTheme
                                ? Color(0xff121315)
                                : Colors.black),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("\$${widget.leftOut.toString()}",
                                style: TextTheme.headline5!.copyWith(
                                  fontSize: 33,
                                  color: widget.bgColor,
                                )),
                            Text(
                              'left out of \$' + widget.budget.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 13, color: Colors.grey),
                            ),
                            SizedBox(height: defaultPadding * 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                                Container(
                                  height: 65,
                                  width: MediaQueryWidth / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        defaultRadius * 2),
                                    color: Colors.grey[800],
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '\$600.00',
                                                style: TextTheme.headline1!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.white),
                                              ),
                                              Text(
                                                'SPENT',
                                                style: TextTheme.headline5!
                                                    .copyWith(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xffc2aeb7)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        VerticalDivider(
                                            color: Colors.grey[500], width: 0),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '\$900.00',
                                                style: TextTheme.headline1!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.white),
                                              ),
                                              Text(
                                                'BALANCE',
                                                style: TextTheme.headline5!
                                                    .copyWith(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xffa8aea4)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,
                                    color: Colors.white),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text('September 2022',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 13, color: Colors.grey)),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    defaultPadding * 1.5,
                                    defaultPadding * 1.5,
                                    defaultPadding * 1.5,
                                    defaultPadding),
                                child: LinearPercentIndicator(
                                    padding: EdgeInsets.all(0),
                                    animation: true,
                                    animationDuration: 1800,
                                    lineHeight: 20,
                                    percent: 15.toDouble() / 100,
                                    center: Row(
                                      children: [
                                        Text(widget.percent.toString() + "%",
                                            style: TextTheme.headline1!
                                                .copyWith(
                                                    fontSize: 13,
                                                    color: Colors.white)),
                                      ],
                                    ),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: widget.bgColor,
                                    backgroundColor: Colors.grey[800])),
                            Text(
                                'You can spend \$100 each day for the rest of the period',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 13, color: Colors.grey)),
                          ],
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      width: MediaQueryWidth,
                      padding: EdgeInsets.fromLTRB(
                          defaultPadding,
                          defaultPadding - 5,
                          defaultPadding,
                          MediaQuery.of(context).padding.bottom +
                              defaultPadding),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Transactions",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          transactionList.length != null &&
                                  transactionList.isNotEmpty
                              ? Column(
                                  children: List.generate(
                                    transactionList.length,
                                    (index) {
                                      return Column(
                                        children: [
                                          if (index % 2 == 0)
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0,
                                                        defaultPadding + 7,
                                                        0,
                                                        defaultPadding),
                                                child: Row(
                                                  children: [
                                                    Text('27 Sep 2021',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline1!
                                                            .copyWith(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .grey)),
                                                  ],
                                                )),
                                          Row(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin: const EdgeInsets.only(
                                                      right: defaultPadding),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          transactionList[index]
                                                              .iconColor!
                                                              .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              defaultRadius)),
                                                  child: Center(
                                                      child: Icon(
                                                          transactionList[index]
                                                              .icon,
                                                          color:
                                                              transactionList[
                                                                      index]
                                                                  .iconColor,
                                                          size: 26))),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      transactionList[index]
                                                          .name
                                                          .toString(),
                                                      style: TextTheme
                                                          .headline5!
                                                          .copyWith(
                                                              fontSize: 16)),
                                                  const SizedBox(height: 5),
                                                  Text("7:00 PM",
                                                      style: TextTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 13)),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                  transactionList[index]
                                                          .upToDown
                                                      ? "-\$" +
                                                          transactionList[index]
                                                              .price
                                                              .toString()
                                                      : "+\$" +
                                                          transactionList[index]
                                                              .price
                                                              .toString(),
                                                  style: TextTheme.headline5!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          color: transactionList[
                                                                      index]
                                                                  .upToDown
                                                              ? redColor
                                                              : greenColor)),
                                              RotatedBox(
                                                quarterTurns:
                                                    transactionList[index]
                                                            .upToDown
                                                        ? 1
                                                        : 3,
                                                child: Icon(
                                                  Icons.arrow_right_alt_rounded,
                                                  color: transactionList[index]
                                                          .upToDown
                                                      ? redColor
                                                      : greenColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (index % 2 == 0)
                                            SizedBox(height: defaultPadding)
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
