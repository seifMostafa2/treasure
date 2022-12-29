// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, prefer_final_fields, unnecessary_null_comparison, unrelated_type_equality_checks, deprecated_member_use, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:finology/Constance/constance.dart';
import 'package:finology/Models/myfiles.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/country_all_picker/lib/country_all_picker_.dart';
import 'package:finology/Widgets/country_all_picker/lib/demo_modell.dart';
import 'package:finology/Widgets/country_all_picker/lib/functions_country_all_picker.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  _AddBudgetState createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  Country? _selectedCountry;
  WalletBottomSheet WalletSheet = WalletBottomSheet();
  BudgetBottomSheet BudgetSheet = BudgetBottomSheet();
  RecurrenceBottomSheet RecurrenceSheet = RecurrenceBottomSheet();

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  Future<DateTime?> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));

  @override
  Widget build(BuildContext context) {
    List<String> subtitle = [
      "All Wallets",
      "All Expensese",
      "Monthly",
      dateFormat.format(selectedDate),
    ];
    List<String> title = ["Wallet", "Budget for", "Recurrence", "Start Date"];

    List<IconData> trailingIcon = [
      Icons.account_balance_wallet,
      FontAwesomeIcons.calculator,
      FontAwesomeIcons.solidCalendarAlt,
      FontAwesomeIcons.solidPlayCircle
    ];
    final country = _selectedCountry;

    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    defaultPadding,
                    MediaQuery.of(context).padding.top + defaultPadding,
                    defaultPadding,
                    defaultPadding),
                child: Row(
                  children: [
                    SplashIcon(
                      icon: Icon(Icons.arrow_back),
                      size: 28,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    AppBarIcons(),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                      defaultPadding,
                      0,
                      defaultPadding,
                      MediaQuery.of(context).padding.bottom + defaultPadding),
                  children: [
                    Text("Budget Name",
                        style: TextTheme.subtitle2!.copyWith(fontSize: 13)),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      padding: EdgeInsets.all(3.7),
                      decoration: BoxDecoration(
                          color: ColorTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(defaultRadius)),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextTheme.headline1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding / 2),
                          border: InputBorder.none,
                          hintText: "Car Insurance",
                          hintStyle:
                              TextTheme.subtitle2!.copyWith(fontSize: 13),
                          prefixIcon: Icon(Icons.watch_later_sharp,
                              color: ColorTheme.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Amount",
                              style:
                                  TextTheme.subtitle2!.copyWith(fontSize: 13)),
                        ),
                        SizedBox(width: defaultPadding),
                        Expanded(
                          child: Text("Currency",
                              style:
                                  TextTheme.subtitle2!.copyWith(fontSize: 13)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,
                            margin: EdgeInsets.only(top: 10, bottom: 0),
                            padding: EdgeInsets.all(3.7),
                            decoration: BoxDecoration(
                                color: ColorTheme.backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextTheme.headline1,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(defaultPadding / 2),
                                border: InputBorder.none,
                                hintText: "Amount",
                                hintStyle:
                                    TextTheme.subtitle2!.copyWith(fontSize: 13),
                                prefixIcon: Icon(Icons.add_comment_outlined,
                                    color: ColorTheme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: defaultPadding),
                        Expanded(
                          child: Container(
                            height: 55,
                            margin: EdgeInsets.only(top: 10, bottom: 0),
                            child: OpenContainer(
                                transitionDuration: Duration(milliseconds: 600),
                                transitionType: _transitionType,
                                openBuilder:
                                    (BuildContext context, VoidCallback _) {
                                  return CurrencyAlertDialog(
                                    callback: (val) {
                                      setState(() {
                                        _selectedCountry = val;
                                      });
                                      Navigator.pop(context, country);
                                    },
                                  );
                                },
                                closedElevation: 0,
                                openColor: ColorTheme.backgroundColor,
                                closedColor: ColorTheme.backgroundColor,
                                closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(defaultRadius))),
                                closedBuilder: (BuildContext context,
                                    VoidCallback openContainer) {
                                  return Container(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Row(
                                      children: [
                                        Icon(Icons.money,
                                            color:
                                                Theme.of(context).primaryColor),
                                        SizedBox(width: defaultPadding),
                                        country == null
                                            ? Text(
                                                'Select Currency',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextTheme.subtitle2!
                                                    .copyWith(fontSize: 13),
                                              )
                                            : Flexible(
                                                child: Text(
                                                  country.currencyName +
                                                      " " +
                                                      country.currencyCode,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextTheme.subtitle2!
                                                      .copyWith(fontSize: 13),
                                                ),
                                              ),
                                        Icon(Icons.keyboard_arrow_down_outlined,
                                            color: ColorTheme.primaryColor)
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 3),
                    for (var i = 0; i < title.length; i++)
                      Column(
                        children: [
                          ListTile(
                            minVerticalPadding: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                            selected: true,
                            selectedTileColor: ColorTheme.backgroundColor,
                            contentPadding: EdgeInsets.only(
                                top: 5,
                                left: defaultPadding,
                                right: defaultPadding,
                                bottom: 5),
                            leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xff5e71b0).withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius)),
                                child: Center(
                                    child: Icon(
                                  trailingIcon[i],
                                  color: ColorTheme.primaryColor,
                                ))),
                            title: Text(title[i],
                                style: TextTheme.headline5!
                                    .copyWith(fontSize: 16)),
                            subtitle: Text(subtitle[i],
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                            trailing: SplashIcon(
                              size: 16,
                              padding: 10,
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              onPressed: () {},
                            ),
                            onTap: () async {
                              if (title[i] == "Wallet") {
                                WalletSheet.walletSheet(context);
                              } else if (title[i] == "Budget for") {
                                BudgetSheet.budgetSheet(context);
                              } else if (title[i] == "Recurrence") {
                                RecurrenceSheet.recurrenceSheet(context);
                              } else if (title[i] == "Start Date") {
                                final selectedDate =
                                    await _selectDateTime(context);
                                if (selectedDate == null) return;
                                debugPrint(selectedDate.toString());
                                setState(() {
                                  this.selectedDate = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    // selectedTime.hour,
                                    // selectedTime.minute,
                                  );
                                });
                              }
                            },
                          ),
                          SizedBox(height: defaultPadding)
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
            defaultPadding,
            defaultPadding,
            defaultPadding,
            MediaQuery.of(context).padding.bottom + defaultPadding),
        child: CustomButton(
          text: "Save New Monthly Budget",
          style:
              TextTheme.headline1!.copyWith(fontSize: 16, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class CurrencyAlertDialog extends StatefulWidget {
  final void Function(Country)? callback;
  const CurrencyAlertDialog({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<CurrencyAlertDialog> createState() => _CurrencyAlertDialogState();
}

class _CurrencyAlertDialogState extends State<CurrencyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          // bottom: MediaQuery.of(context).padding.bottom + defaultPadding,
          top: MediaQuery.of(context).padding.top + defaultPadding,
        ),
        child: CountryAllPicker(
            countryCode: false,
            currencyCode: true,
            searchInputDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Theme.of(context).dividerColor)),
                prefixIcon: Icon(Icons.search),
                hintText: "Type name here",
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
            onSelected: (country) {
              widget.callback!(country);
            }),
      ),
    );
  }
}

class WalletBottomSheet {
  walletSheet(BuildContext context) {
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
                      top: Radius.circular(defaultRadius)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: defaultPadding * 1.5,
                          horizontal: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Wallet',
                              style: Theme.of(context).textTheme.headline5),
                          SplashIcon(
                            padding: 8,
                            size: 23,
                            color: greenColor,
                            icon: Icon(Icons.done),
                            iconColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 40),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 30),
                        itemCount: selectWalletList.length != null &&
                                selectWalletList.isNotEmpty
                            ? selectWalletList.length
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
                                  right: defaultPadding,
                                  top: 5,
                                  left: 3,
                                  bottom: 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).disabledColor,
                                      blurRadius: 5,
                                      spreadRadius: 2),
                                ],
                              ),
                              child: selectWalletList.length != null &&
                                      selectWalletList.isNotEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 23,
                                          backgroundColor: Colors.grey[200],
                                          child: Center(
                                            child: BounceInDown(
                                              child: Image.asset(
                                                selectWalletList[index].logo,
                                                height: 28,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            height: defaultPadding - 5),
                                        Text(selectWalletList[index].bankName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(fontSize: 18)),
                                        const SizedBox(
                                            height: defaultPadding - 8),
                                        Text(
                                            selectWalletList[index]
                                                .accountNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 13)),
                                        const SizedBox(
                                            height: defaultPadding - 8),
                                        Text(selectWalletList[index].balance,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 13)),
                                        const SizedBox(
                                            height: defaultPadding - 8),
                                        SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                style: selectWalletList[index]
                                                        .isAdded
                                                    ? ButtonStyle()
                                                    : ElevatedButton.styleFrom(
                                                        primary: Theme.of(
                                                                context)
                                                            .backgroundColor,
                                                        side: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        )),
                                                onPressed: () {
                                                  setState(() {
                                                    selectWalletList[index]
                                                            .isAdded =
                                                        !selectWalletList[index]
                                                            .isAdded;
                                                  });
                                                },
                                                child: Center(
                                                    child: Text(
                                                  selectWalletList[index]
                                                          .isAdded
                                                      ? "Added"
                                                      : "Add",
                                                  style: TextStyle(
                                                      color: selectWalletList[
                                                                  index]
                                                              .isAdded
                                                          ? Colors.white
                                                          : Theme.of(context)
                                                              .primaryColor),
                                                )))),
                                      ],
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

void BudgetTileSelected(int index) {
  budgetCategoriesList[index].selected = !budgetCategoriesList[index].selected;
  log(budgetCategoriesList[index].selected.toString());
}

class BudgetBottomSheet {
  budgetSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.95,
                builder: (_, controller) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        padding: EdgeInsets.only(
                            top: defaultPadding * 1.5,
                            right: defaultPadding,
                            left: defaultPadding),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(defaultRadius),
                            topRight: Radius.circular(defaultRadius),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Budget for',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                SplashIcon(
                                  padding: 8,
                                  size: 23,
                                  color: greenColor,
                                  icon: Icon(Icons.done),
                                  iconColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: defaultPadding * 1.5,
                                    bottom: defaultPadding),
                                padding: EdgeInsets.all(3.7),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor,
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius)),
                                child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        border: InputBorder.none,
                                        hintText: "Search",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(fontSize: 13),
                                        prefixIcon: Icon(Icons.search)))),
                            Expanded(
                              child: ListView(
                                controller: controller,
                                padding: EdgeInsets.fromLTRB(0, 5, 0,
                                    MediaQuery.of(context).padding.bottom),
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("RECENT",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(fontSize: 13)),
                                      SizedBox(height: defaultPadding),
                                      Column(
                                        children: List.generate(
                                            budgetCategoriesList.length,
                                            (index) {
                                          return Column(
                                            children: [
                                              if (index == 2)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Divider(height: 0),
                                                    SizedBox(
                                                        height: defaultPadding *
                                                            1.3),
                                                    Text("ALL CATEGORIES",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                                fontSize: 13)),
                                                    SizedBox(
                                                        height: defaultPadding),
                                                  ],
                                                ),
                                              ListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  minVerticalPadding: 0,
                                                  onTap: () {
                                                    BudgetTileSelected(index);
                                                    setState(() {});
                                                  },
                                                  selected: budgetCategoriesList[index]
                                                      .selected,
                                                  leading: Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xff5e71b0)
                                                              .withOpacity(0.1),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  defaultRadius)),
                                                      child: Center(
                                                          child: Icon(budgetCategoriesList[index].icon,
                                                              color: budgetCategoriesList[index]
                                                                  .iconColor))),
                                                  title: Text(budgetCategoriesList[index].title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(fontSize: 17)),
                                                  trailing: SplashIcon(
                                                    padding: 7,
                                                    size: 17,
                                                    color: budgetCategoriesList[
                                                                index]
                                                            .selected
                                                        ? blueColor
                                                        : Theme.of(context)
                                                            .dividerColor,
                                                    icon: Icon(Icons.done),
                                                    iconColor: Colors.white,
                                                    onPressed: () {
                                                      BudgetTileSelected(index);
                                                      setState(() {});
                                                    },
                                                  )),
                                              SizedBox(height: defaultPadding)
                                            ],
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

void RecurrencButtonSelected(int index) {
  /* SingleSlectedItem */
  for (int i = 0; i < recurrenceList.length; i++) {
    if (i == index) {
      recurrenceList[i].selected = true;
    } else {
      recurrenceList[i].selected = false;
    }
  }
  /* MultipleSelect */
  // recurrenceList[index].selected = !recurrenceList[index].selected;
  log(recurrenceList[index].selected.toString());
}

class RecurrenceBottomSheet {
  recurrenceSheet(BuildContext context) {
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
                    bottom:
                        MediaQuery.of(context).padding.bottom + defaultPadding),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(defaultRadius))),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Recurrence',
                          style: Theme.of(context).textTheme.headline5),
                      SizedBox(height: defaultPadding * 1.5),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recurrenceList.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Material(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            color: Theme.of(context).backgroundColor,
                            child: InkWell(
                              onTap: () {
                                RecurrencButtonSelected(index);
                                setState(() {});
                              },
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              child: Container(
                                margin: EdgeInsets.all(defaultPadding * 1.8),
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Color(0xff5e71b0)
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultRadius)),
                                            child: Center(
                                                child: Icon(
                                                    recurrenceList[index].icon,
                                                    color: recurrenceList[index]
                                                        .color))),
                                        SplashIcon(
                                          padding: 7,
                                          size: 17,
                                          color: recurrenceList[index].selected
                                              ? blueColor
                                              : Theme.of(context).dividerColor,
                                          icon: Icon(Icons.done),
                                          iconColor: Colors.white,
                                          onPressed: () {
                                            RecurrencButtonSelected(index);
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: defaultPadding - 5),
                                    Text(recurrenceList[index].text.toString())
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
              );
            },
          ),
        );
      },
    );
  }
}
