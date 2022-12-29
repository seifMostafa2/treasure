// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, deprecated_member_use, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:finology/Constance/constance.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'add_budget.dart';
import 'monthly_view.dart';

class MonthlyBudgets extends StatefulWidget {
  const MonthlyBudgets({Key? key}) : super(key: key);

  @override
  _MonthlyBudgetsState createState() => _MonthlyBudgetsState();
}

class _MonthlyBudgetsState extends State<MonthlyBudgets> {
  @override
  Widget build(BuildContext context) {
    var ThemeData = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    Text("Monthly",
                        style: TextTheme.headline1!.copyWith(fontSize: 19)),
                    Spacer(),
                    AppBarIcons(),
                  ],
                ),
                Row(
                  children: [
                    Text("Budgets",
                        style: TextTheme.headline1!.copyWith(
                            fontSize: 33, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultPadding - 5, 0, 0, defaultPadding),
                      child: SplashIcon(
                        padding: 14,
                        color: Colors.lightBlue,
                        icon: Icon(Icons.add),
                        iconColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: AddBudget(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding,
                  MediaQuery.of(context).padding.bottom + defaultPadding * 2.5),
              children: [
                SizedBox(
                    width: MediaQueryWidth,
                    // color: Colors.black12,
                    child: Column(
                      children: List.generate(
                        monthlyBudgetsList.length,
                        (index) {
                          return Column(
                            children: [
                              if (index != 2)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: defaultPadding),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 55,
                                              width: 55,
                                              margin: const EdgeInsets.only(
                                                  right: defaultPadding),
                                              decoration: BoxDecoration(
                                                  color:
                                                      monthlyBudgetsList[index]
                                                          .iconColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultRadius)),
                                              child: Center(
                                                  child: Icon(
                                                      monthlyBudgetsList[index]
                                                          .icon,
                                                      color: Colors.white,
                                                      size: 30))),
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
                                                  "\$${monthlyBudgetsList[index].budget.toString()}/month",
                                                  style: TextTheme.subtitle2!
                                                      .copyWith(fontSize: 13)),
                                            ],
                                          ),
                                          const Spacer(),
                                          SplashIcon(
                                            size: 16,
                                            padding: 10,
                                            color:
                                                Theme.of(context).dividerColor,
                                            icon: Icon(Icons
                                                .arrow_forward_ios_rounded),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              MonthlyBudgetView(
                                                                leftOut:
                                                                    monthlyBudgetsList[
                                                                            index]
                                                                        .leftOut,
                                                                budget:
                                                                    monthlyBudgetsList[
                                                                            index]
                                                                        .budget,
                                                                caption:
                                                                    monthlyBudgetsList[
                                                                            index]
                                                                        .caption,
                                                                name: monthlyBudgetsList[
                                                                        index]
                                                                    .name,
                                                                percent:
                                                                    monthlyBudgetsList[
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
                                      SizedBox(height: defaultPadding),
                                      Row(
                                        children: [
                                          SizedBox(width: defaultPadding - 8),
                                          RichText(
                                            text: TextSpan(
                                              text:
                                                  "\$${monthlyBudgetsList[index].leftOut.toString()}",
                                              style: TextTheme.headline5!
                                                  .copyWith(fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        " Left out of \$${monthlyBudgetsList[index].budget.toString()}",
                                                    style: TextTheme.subtitle2!
                                                        .copyWith(
                                                            fontSize: 13)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            defaultPadding,
                                            8,
                                            defaultPadding,
                                            defaultPadding),
                                        child: LinearPercentIndicator(
                                            padding: EdgeInsets.all(0),
                                            animation: true,
                                            animationDuration: 1800,
                                            lineHeight: 20,
                                            percent: monthlyBudgetsList[index]
                                                    .percent!
                                                    .toDouble() /
                                                100,
                                            center: Row(
                                              children: [
                                                Text(
                                                    monthlyBudgetsList[index]
                                                            .percent
                                                            .toString() +
                                                        "%",
                                                    style: TextTheme.headline1!
                                                        .copyWith(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.white)),
                                              ],
                                            ),
                                            linearStrokeCap:
                                                LinearStrokeCap.roundAll,
                                            progressColor:
                                                monthlyBudgetsList[index]
                                                    .iconColor,
                                            backgroundColor: Colors.white),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("September 1,2021",
                                              style: TextTheme.subtitle2!
                                                  .copyWith(fontSize: 10)),
                                          Text("September 30,2021",
                                              style: TextTheme.subtitle2!
                                                  .copyWith(fontSize: 10)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              if (index != 2) Divider(height: defaultPadding)
                            ],
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
