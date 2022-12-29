// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, camel_case_types, prefer_adjacent_string_concatenation, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:finology/Constance/constance.dart';
import 'invest_dashbord.dart';
import 'manage_dashbord.dart';

class Actor {
  const Actor(this.name, this.initials, this.color);
  final String name;
  final String initials;
  final Color color;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  static List<Tab> tabs = [
    Tab(text: "Manage"),
    Tab(text: 'Invest'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    var ThemeColor = Theme.of(context);
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
        title: Padding(
          padding: EdgeInsets.only(right: defaultPadding - 5),
          child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(defaultRadius - 5),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColor.disabledColor,
                        blurRadius: 10,
                        spreadRadius: 2),
                  ]),
              child: TabBar(
                  enableFeedback: true,
                  controller: tabController,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius - 5),
                      color: blueColor),
                  unselectedLabelColor: Theme.of(context).iconTheme.color,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  tabs: tabs)),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(defaultPadding - 5,
                  defaultPadding, defaultPadding, defaultPadding),
              child: AppBarIcons())
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          HomeManage(),
          HomeInvest(),
        ],
      ),
    );
  }
}
