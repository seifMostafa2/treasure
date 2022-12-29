// ignore_for_file: library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  SubscriptionData objSubscriptionData = SubscriptionData();

  @override
  Widget build(BuildContext context) {
    var backgroundColor = AppTheme.isLightTheme
        ? Theme.of(context).scaffoldBackgroundColor
        : const Color(0xff121315);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: SplashIcon(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 45),
              Image.asset(ConstanceData.creditCard, height: 95),
              Padding(
                  padding: const EdgeInsets.all(defaultPadding - 5),
                  child: Text("Become a Memeber",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 33, fontWeight: FontWeight.bold))),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 5),
                  child: Text(
                      "Start Saving tou money and time for what's truly importantin your life.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12))),
              Padding(
                padding: const EdgeInsets.only(
                  right: defaultPadding * 3,
                  left: defaultPadding * 3,
                  top: defaultPadding * 1.5,
                  bottom: defaultPadding - 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SplashIcon(
                                  padding: 7,
                                  size: 17,
                                  color: greenColor,
                                  icon: const Icon(Icons.done),
                                  iconColor: Colors.white,
                                  onPressed: null),
                              const SizedBox(width: defaultPadding - 5),
                              Flexible(
                                child: Text("Bank Account Sync",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14)),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              SplashIcon(
                                  padding: 7,
                                  size: 17,
                                  color: greenColor,
                                  icon: const Icon(Icons.done),
                                  iconColor: Colors.white,
                                  onPressed: null),
                              const SizedBox(width: defaultPadding - 5),
                              Flexible(
                                child: Text("Share Wallets With Others",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SplashIcon(
                                  padding: 7,
                                  size: 17,
                                  color: greenColor,
                                  icon: const Icon(Icons.done),
                                  iconColor: Colors.white,
                                  onPressed: null),
                              const SizedBox(width: defaultPadding - 5),
                              Flexible(
                                child: Text("Unlimited Budgets",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14)),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              SplashIcon(
                                  padding: 7,
                                  size: 17,
                                  color: greenColor,
                                  icon: const Icon(Icons.done),
                                  iconColor: Colors.white,
                                  onPressed: null),
                              const SizedBox(width: defaultPadding - 5),
                              Flexible(
                                child: Text("Unlimited Labels",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).disabledColor,
                      blurRadius: 5,
                      spreadRadius: 2),
                ],
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(defaultRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        right: defaultPadding,
                        left: defaultPadding,
                        top: defaultPadding,
                        bottom: defaultPadding - 5),
                    child: Text("Select Your Subscription",
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.start)),
                Container(
                  height: 185,
                  color: Theme.of(context).backgroundColor,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 30),
                    itemCount: subscriptionList.isNotEmpty
                        ? subscriptionList.length
                        : 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              border: Border.all(
                                  color: subscriptionList[index].selected
                                      ? blueColor
                                      : Colors.transparent,
                                  width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).disabledColor,
                                    blurRadius: 10,
                                    spreadRadius: 2),
                              ],
                            ),
                            margin: const EdgeInsets.only(
                                right: defaultPadding,
                                top: 8,
                                left: 3,
                                bottom: 8),
                            width: 160,
                            child: Material(
                                elevation: 0,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                color: Theme.of(context).backgroundColor,
                                child: InkWell(
                                    onTap: () {
                                      subscriptionSelected(index);
                                      setState(() {});
                                    },
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0,
                                            bottom: 0,
                                            left: defaultPadding * 1.5,
                                            right: defaultPadding * 1.5),
                                        child: subscriptionList.isNotEmpty
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                      radius: 23,
                                                      backgroundColor:
                                                          subscriptionList[
                                                                  index]
                                                              .color,
                                                      child: Center(
                                                        child: Text(
                                                            subscriptionList[
                                                                    index]
                                                                .logo
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                                    fontSize:
                                                                        20)),
                                                      )),
                                                  const SizedBox(
                                                      height:
                                                          defaultPadding + 5),
                                                  Text(
                                                      subscriptionList[index]
                                                          .time
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 12)),
                                                  const SizedBox(
                                                      height:
                                                          defaultPadding - 3),
                                                  Text(
                                                      subscriptionList[index]
                                                          .price,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                              color: subscriptionList[
                                                                          index]
                                                                      .selected
                                                                  ? blueColor
                                                                  : null)),
                                                  const SizedBox(
                                                      height:
                                                          defaultPadding - 3),
                                                  Text(
                                                      subscriptionList[index]
                                                          .perMonth,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 12)),
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
                  padding: EdgeInsets.fromLTRB(
                      defaultPadding,
                      defaultPadding - 7,
                      defaultPadding,
                      MediaQuery.of(context).padding.bottom + defaultPadding),
                  child: CustomButton(
                    text: "Subscribe Now",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void subscriptionSelected(int index) {
    /* SingleSlectedItem */
    for (int i = 0; i < subscriptionList.length; i++) {
      if (i == index) {
        subscriptionList[i].selected = true;
      } else {
        subscriptionList[i].selected = false;
      }
    }
    /* MultipleSelect */
    // subscriptionList[index].selected = !subscriptionList[index].selected;
    subscriptionList[index].transactionindex = index;
    objSubscriptionData = subscriptionList[index];
  }
}
