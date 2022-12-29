// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_collection_literals, unnecessary_this, deprecated_member_use

import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllData {
  static String myBalance = "\$8720.76";
  static String myName = "Surinder";
}

class UserDataInfo {
  bool upToDown = true;
  String? price;
  String? name;
  IconData? icon;
  Color? iconColor;

  UserDataInfo(
      {this.upToDown = true, this.price, this.name, this.icon, this.iconColor});
}

List transactionList = [
  UserDataInfo(
      icon: Icons.fastfood_sharp,
      name: 'شراء من مطعم',
      price: '20',
      upToDown: true,
      iconColor: Color(0xff6162d8)),
  UserDataInfo(
      upToDown: false,
      price: '22',
      name: 'شراء من مطعم',
      icon: FontAwesomeIcons.wallet,
      iconColor: Color(0xff07b4f9)),
  UserDataInfo(
      upToDown: true,
      price: '20',
      name: 'مدخراتى',
      icon: Icons.shopping_bag_rounded,
      iconColor: Color(0xfff37c1e)),
];

class MonthlyBudget {
  String? budget, name, emojis, leftOut, caption;
  IconData? icon;
  Color? iconColor;
  int? percent;

  MonthlyBudget({
    this.percent,
    this.budget,
    this.name,
    this.icon,
    this.iconColor,
    this.emojis,
    this.caption,
    this.leftOut,
  });
}

List monthlyBudgetsList = [
  MonthlyBudget(
      percent: 35,
      emojis: "🤗",
      leftOut: "900",
      budget: '1500',
      name: 'Food & Drinks',
      caption: 'Good Job! Your spending is on track',
      icon: Icons.fastfood_sharp,
      iconColor: greenColor),
  MonthlyBudget(
      percent: 15,
      emojis: "😡",
      leftOut: "250",
      budget: '1000',
      name: 'Shopping',
      caption: 'Good Job! Your spending is on track',
      icon: Icons.shopping_bag_rounded,
      iconColor: Color(0xfff37c1e)),
  MonthlyBudget(
      percent: 50,
      emojis: "🥰",
      leftOut: "700",
      budget: '2000',
      name: 'Freelanising Work',
      caption: 'Good Job! Your spending is on track',
      icon: FontAwesomeIcons.wallet,
      iconColor: Color(0xff07b4f9)),
  MonthlyBudget(
      percent: 25,
      emojis: "👌",
      leftOut: "1000",
      budget: '1500',
      name: 'Holidays',
      caption: 'Good Job! Your spending is on track',
      icon: Icons.shopping_bag_rounded,
      iconColor: Color(0xff07b4f9)),
];

class MonthlySubscriptions {
  String? name;
  String? logo;
  String? price;
  String? date;

  MonthlySubscriptions({
    this.name,
    this.logo,
    this.price,
    this.date,
  });
}

List monthlySubscriptionsList = [
  MonthlySubscriptions(
      name: 'Google',
      price: "21",
      date: "26 May",
      logo: ConstanceData.googleIcon),
  MonthlySubscriptions(
      name: 'Youtube',
      price: "27",
      date: "28 May",
      logo: ConstanceData.youtubeIcon),
  MonthlySubscriptions(
      name: 'Netflix',
      price: "25",
      date: "30 Dec",
      logo: ConstanceData.netfilixIcon),
];

class InvestCard {
  String? bgImage;
  String? caption;

  InvestCard({this.bgImage, this.caption});
}

List investCardList = [
  InvestCard(
      caption: "Invite your friends to Finology and get Up to \$100 budgets.",
      bgImage: ConstanceData.investCard1),
  InvestCard(
      caption: "Invite your friends to Finology and get Up to \$100 budgets.",
      bgImage: ConstanceData.investCard2),
  InvestCard(
      caption: "Invite your friends to Finology and get Up to \$100 budgets.",
      bgImage: ConstanceData.investCard3),
  InvestCard(
      caption: "Invite your friends to Finology and get Up to \$100 budgets.",
      bgImage: ConstanceData.investCard4),
];

class PortfolioData {
  String? bgImage;
  String? caption;
  String? title;
  String? price;
  String? parentage;
  Color? color;

  PortfolioData(
      {this.bgImage,
      this.caption,
      this.title,
      this.price,
      this.parentage,
      this.color});
}

List portfolioList = [
  PortfolioData(
      title: "Mutual Funds",
      caption: "NSE",
      price: "17,691.25",
      parentage: "+320.32 (0.85%)",
      color: blueColor,
      bgImage: ConstanceData.mutualFunds),
  PortfolioData(
      title: "Equities",
      caption: "BSE",
      price: "59,299.32",
      parentage: "+475.23 (0.87%)",
      color: Color(0xffdf7925),
      bgImage: ConstanceData.equitiesIcon),
];

class TopGainersData {
  String? title;
  String? caption;
  String? price;
  String? parentage;

  TopGainersData({this.caption, this.title, this.price, this.parentage});
}

List topGainersDataList = [
  TopGainersData(
      title: "Kotak Group",
      caption: "Listed in BSE",
      price: "14,691.25",
      parentage: "+3.4 (0.91%)"),
  TopGainersData(
      title: "TCS",
      caption: "Listed in BSE",
      price: "11,485.26",
      parentage: "+5.2 (1.78%)"),
  TopGainersData(
      title: "HDFC Bank",
      caption: "Listed in NSE",
      price: "25,568.15",
      parentage: "+4.8 (1.21%)"),
];

class TopLosersData {
  String? title;
  String? caption;
  String? price;
  String? parentage;

  TopLosersData({this.caption, this.title, this.price, this.parentage});
}

List topLosersDataList = [
  TopLosersData(
      title: "Reliance Industries",
      caption: "Listed in BSE",
      price: "14,691.25",
      parentage: "-4.4 (0.91%)"),
  TopLosersData(
      title: "Axis Bank",
      caption: "Listed in BSE",
      price: "11,485.26",
      parentage: "-4.5 (1.78%)"),
  TopLosersData(
      title: "Parag Parik Fund",
      caption: "Listed in NSE",
      price: "25,568.15",
      parentage: "-3.2 (1.21%)"),
];

class SelectWallet {
  String? bankName, logo, accountNumber, balance, buttonText;
  bool isAdded;

  SelectWallet(
      {this.bankName,
      this.logo,
      this.balance,
      this.accountNumber,
      this.isAdded = false});
}

List selectWalletList = [
  SelectWallet(
      bankName: 'Axix Bank',
      logo: ConstanceData.googleIcon,
      accountNumber: "45726XXXXXX6745",
      balance: "\$20,000",
      isAdded: true),
  SelectWallet(
      bankName: 'HDFC Bank',
      logo: ConstanceData.youtubeIcon,
      accountNumber: "4556XXXXXX5413",
      balance: "\$20,000"),
  SelectWallet(
      bankName: 'SBI Bank',
      logo: ConstanceData.netfilixIcon,
      accountNumber: "45789XXXXXX1687",
      balance: "\$20,000"),
];

class BudgetCategories {
  final String title;
  final IconData icon;
  final Color iconColor;
  bool selectingmode = true;
  bool selected = false;
  BudgetCategories(this.title, this.icon, this.iconColor);
}

List<BudgetCategories> budgetCategoriesList = <BudgetCategories>[
  BudgetCategories('Beauty', Icons.person, Colors.red),
  BudgetCategories('Bills & Fees', Icons.document_scanner, Colors.blue),
  BudgetCategories('Car', FontAwesomeIcons.car, Colors.green),
  BudgetCategories('Education', Icons.cast_for_education, Colors.lime),
  BudgetCategories('Entertainment', Icons.ac_unit_sharp, Colors.indigo),
  BudgetCategories('Family & Personal', Icons.family_restroom, Colors.yellow),
  BudgetCategories('Food & Drink', Icons.fastfood_rounded, Colors.red),
  BudgetCategories('Gifts', Icons.card_giftcard, Colors.blue),
  BudgetCategories(
      'Groceries', Icons.local_grocery_store_rounded, Colors.green),
  BudgetCategories('Healthcare', Icons.health_and_safety, Colors.lime),
  /* 2+ */
  BudgetCategories('Car', FontAwesomeIcons.car, Colors.green),
  BudgetCategories('Education', Icons.cast_for_education, Colors.lime),
  BudgetCategories('Entertainment', Icons.ac_unit_sharp, Colors.indigo),
  BudgetCategories('Family & Personal', Icons.family_restroom, Colors.yellow),
  BudgetCategories('Food & Drink', Icons.fastfood_rounded, Colors.red),
  BudgetCategories('Gifts', Icons.card_giftcard, Colors.blue),
  BudgetCategories(
      'Groceries', Icons.local_grocery_store_rounded, Colors.green),
  BudgetCategories('Healthcare', Icons.health_and_safety, Colors.lime),
];

class Recurrence {
  final dynamic icon;
  final String? text;
  final Color? color;
  bool selected = false;

  Recurrence({
    this.icon,
    this.text,
    this.color,
    this.selected = false,
  });
}

List<Recurrence> recurrenceList = <Recurrence>[
  Recurrence(
      icon: Icons.dashboard_customize,
      text: "Custom (Once)",
      color: Color(0xfffdc043)),
  Recurrence(
      icon: Icons.circle_outlined, text: "Daily", color: Color(0xffdd5c72)),
  Recurrence(icon: Icons.calendar_today, text: "Weekly", color: blueColor),
  Recurrence(icon: Icons.calendar_today, text: "Monthly", color: greenColor),
];

class ConnectedAccounts {
  String? name;
  String? logo;
  String? type;
  int? balance;
  bool selected = false;
  int transactionindex = 0;

  ConnectedAccounts({
    this.name,
    this.logo,
    this.type,
    this.balance,
    this.selected = false,
    this.transactionindex = 0,
  });
}

List<ConnectedAccounts> connectedAccountsList = <ConnectedAccounts>[
  ConnectedAccounts(
      /*name: 'Axis'*/
      type: "الادخار #1",
      balance: 9876,
      selected: true,
      logo: ConstanceData.claylogo),
  ConnectedAccounts(
      name: 'HDFC',
      type:  "الادخار #2",
    selected: true,
      balance: 9876,
      logo: ConstanceData.claylogo),
  ConnectedAccounts(
      name: 'SBI',
      type:  "الادخار #3",
    selected: true,
      balance: 9876,
      logo: ConstanceData.claylogo),
];

class NewBanks {
  String? name;
  String? logo;
  bool selected = false;

  NewBanks({
    this.name,
    this.logo,
    this.selected = false,
  });
}

List<NewBanks> newBanksList = <NewBanks>[
  NewBanks(name: 'AXIS Bank', selected: true, logo: ConstanceData.googleIcon),
  NewBanks(name: 'HDFC Bank', logo: ConstanceData.youtubeIcon),
  NewBanks(name: 'SBI Bank', logo: ConstanceData.netfilixIcon),
  NewBanks(name: 'CENTRAL Bank', logo: ConstanceData.googleIcon),
  NewBanks(name: 'UNION Bank', logo: ConstanceData.youtubeIcon),
  NewBanks(name: 'INDUSIND Bank', logo: ConstanceData.netfilixIcon),
];

class MyWalletRecent {
  String? name;
  String? image;

  MyWalletRecent({
    this.name,
    this.image,
  });
}

List<MyWalletRecent> myWalletRecentList = <MyWalletRecent>[
  MyWalletRecent(name: 'Alberta', image: ConstanceData.googleIcon),
  MyWalletRecent(name: 'Elly', image: ConstanceData.youtubeIcon),
  MyWalletRecent(name: 'Wing', image: ConstanceData.netfilixIcon),
  MyWalletRecent(name: 'Romie', image: ConstanceData.googleIcon),
  MyWalletRecent(name: 'Ellie', image: ConstanceData.youtubeIcon),
  MyWalletRecent(name: 'Alicia', image: ConstanceData.netfilixIcon),
  MyWalletRecent(name: 'Shawn', image: ConstanceData.netfilixIcon),
  MyWalletRecent(name: 'Tanya', image: ConstanceData.netfilixIcon),
  MyWalletRecent(name: 'Elias', image: ConstanceData.netfilixIcon),
];

class TransferMoney {
  String? name;
  IconData icon;
  Color iconColor;

  TransferMoney({
    this.name,
    this.icon = Icons.circle_outlined,
    this.iconColor = Colors.white,
  });
}

List<TransferMoney> transferMoneytList = <TransferMoney>[
  TransferMoney(
      name: 'Bamk Transfer',
      icon: Icons.account_balance_outlined,
      iconColor: Color(0xff6665DD)),
  TransferMoney(
      name: 'UPI Transfer',
      icon: Icons.send_to_mobile_outlined,
      iconColor: Color(0xffFFA801)),
  TransferMoney(
      name: 'Scan QR', icon: Icons.qr_code_scanner, iconColor: blueColor),
  TransferMoney(
      name: 'Contact', icon: Icons.contacts_rounded, iconColor: Colors.teal),
];

class WalletCategories {
  String name;
  IconData icon;
  Color iconColor;

  WalletCategories({
    this.name = "",
    this.icon = Icons.circle_outlined,
    this.iconColor = Colors.white,
  });
}

List<WalletCategories> walletCategoriesList = <WalletCategories>[
  WalletCategories(
      name: 'Pay', icon: Icons.payments_outlined, iconColor: blueColor),
  WalletCategories(
      name: 'Transfer',
      icon: Icons.table_view_rounded,
      iconColor: Color(0xff6665DD)),
  WalletCategories(
      name: 'Recharge',
      icon: Icons.tablet_android,
      iconColor: Color(0xffDE812C)),
  WalletCategories(
      name: 'Send', icon: Icons.person, iconColor: Color(0xff32D4D7)),
  WalletCategories(
      name: 'Bill', icon: Icons.description, iconColor: Color(0xffD876EA)),
  WalletCategories(
      name: 'Electricity',
      icon: Icons.electrical_services_rounded,
      iconColor: Color(0xffFFA801)),
  WalletCategories(
      name: 'Insurance',
      icon: Icons.health_and_safety,
      iconColor: Color(0xff55D59E)),
  WalletCategories(
      name: 'Car', icon: FontAwesomeIcons.carAlt, iconColor: blueColor),
];

class SubscriptionData {
  String logo;
  String time;
  String price;
  String perMonth;
  Color color;
  bool selected = false;
  int transactionindex = 0;

  SubscriptionData({
    this.logo = "😭",
    this.time = "0000",
    this.price = "\$9999",
    this.perMonth = "00",
    this.color = Colors.grey,
    this.selected = false,
    this.transactionindex = 0,
  });
}

List<SubscriptionData> subscriptionList = <SubscriptionData>[
  SubscriptionData(
      logo: "⭐",
      time: '3 MONTH',
      price: "\$30.99",
      color: Color(0xff7F5CFE),
      perMonth: "\$9.86 per month"),
  SubscriptionData(
      logo: "🌟",
      time: '6 MONTH',
      price: "\$55.99",
      selected: true,
      color: blueColor,
      perMonth: "\$9.86 per month"),
  SubscriptionData(
      logo: "🔥",
      time: '9 MONTH',
      price: "\$99.99",
      color: Color(0xffD65BFF),
      perMonth: "\$9.86 per month"),
  SubscriptionData(
      logo: "🌞",
      time: '12 MONTH',
      price: "\$149.99",
      color: greenColor,
      perMonth: "\$9.86 per month"),
];
