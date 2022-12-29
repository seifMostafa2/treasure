// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  bool _showBackToTopButton = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeInOutQuint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leadingWidth: MediaQuery.of(context).size.width / 2,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: SplashIcon(
              icon: Icon(Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color),
              size: 28,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: const [
              Padding(
                  padding: EdgeInsets.fromLTRB(defaultPadding - 5,
                      defaultPadding, defaultPadding, defaultPadding),
                  child: AppBarIcons())
            ],
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(defaultPadding),
              children: [
                Text("Transactions",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 33, fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(
                      top: defaultPadding, bottom: defaultPadding * 1.5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).disabledColor,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0.0, 2.0)),
                    ],
                  ),
                  child: TextFormField(
                      textInputAction: TextInputAction.search,
                      textAlignVertical: TextAlignVertical.center,
                      style: Theme.of(context).textTheme.headline1,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          filled: true,
                          fillColor: AppTheme.isLightTheme
                              ? Theme.of(context).backgroundColor
                              : Colors.black,
                          hintText: "Search",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 16),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 16),
                          prefixIcon: const Icon(Icons.search, size: 26),
                          suffixIcon:
                              const Icon(Icons.filter_alt_outlined, size: 26),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius - 5),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius - 5),
                              borderSide: BorderSide(
                                  color:
                                      AppTheme.isLightTheme ? Theme.of(context).backgroundColor : Theme.of(context).dividerColor,
                                  width: 1)))),
                ),
                for (var i = 0; i < transactionList.length; i++)
                  for (var i = 0; i < transactionList.length; i++)
                    Column(
                      children: List.generate(
                        transactionList.length,
                        (index) {
                          return Column(
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
                                          borderRadius: BorderRadius.circular(
                                              defaultRadius)),
                                      child: Center(
                                          child: Icon(
                                              transactionList[index].icon,
                                              color: transactionList[index]
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text("24/08/21",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 16,
                                              color: transactionList[index]
                                                      .upToDown
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
                              const Divider(height: defaultPadding * 2),
                            ],
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              mini: true,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            ),
    );
  }
}
