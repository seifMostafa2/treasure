// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:animations/animations.dart';
import 'package:finology/Constance/constance.dart';
import 'package:finology/Widgets/Navigator/navigator_page.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:finology/Widgets/country_all_picker/lib/country_all_picker_.dart';
import 'package:finology/Widgets/country_all_picker/lib/demo_modell.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'verity_your_identity.dart';

class EnterMobileNumber extends StatefulWidget {
  const EnterMobileNumber({Key? key}) : super(key: key);

  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  Country? _selectedCountry;
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
            context, SlideRightRoute(widget: VerityYourIdentity()));
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  MediaQuery.of(context).padding.top + defaultPadding,
                  defaultPadding,
                  MediaQuery.of(context).padding.bottom + defaultPadding),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      SplashIcon(
                          onPressed: () {
                            Navigator.push(context,
                                SlideRightRoute(widget: VerityYourIdentity()));
                          },
                          icon: Icon(Icons.arrow_back_rounded,
                              color: Theme.of(context).iconTheme.color)),
                    ]),
                    SizedBox(height: defaultPadding * 1.5),
                    Text("Enter\nMobile Number",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: 58,
                            child: OpenContainer(
                              transitionDuration: Duration(milliseconds: 600),
                              transitionType: _transitionType,
                              openBuilder:
                                  (BuildContext context, VoidCallback _) {
                                return CallingCodeDialog(
                                  callback: (val) {
                                    setState(() {
                                      _selectedCountry = val;
                                    });
                                    Navigator.pop(context, country);
                                  },
                                );
                              },
                              closedElevation: 0,
                              openColor: Theme.of(context).backgroundColor,
                              closedColor: Theme.of(context).backgroundColor,
                              closedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(defaultRadius))),
                              closedBuilder: (BuildContext context,
                                  VoidCallback openContainer) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(defaultRadius)),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).dividerColor)),
                                  padding: EdgeInsets.all(defaultPadding / 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      country == null
                                          ? Text(
                                              'Select No.',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 14),
                                            )
                                          : Flexible(
                                              child: Text(
                                                country.callingCode,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                            ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: defaultPadding),
                        Flexible(
                          flex: 6,
                          child: CustomField(
                            horizontalPadding: defaultPadding,
                            hintText: 'Enter your number',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: defaultPadding,
                        top: defaultRadius,
                        bottom: MediaQuery.of(context).padding.bottom +
                            defaultPadding),
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.enterOTP);
                      },
                      text: 'Send OTP',
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CallingCodeDialog extends StatefulWidget {
  final void Function(Country)? callback;
  const CallingCodeDialog({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<CallingCodeDialog> createState() => _CallingCodeDialogState();
}

class _CallingCodeDialogState extends State<CallingCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
            top: MediaQuery.of(context).padding.top + defaultPadding),
        child: CountryAllPicker(
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
