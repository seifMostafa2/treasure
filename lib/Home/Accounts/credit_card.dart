// ignore_for_file: unused_local_variable, non_constant_identifier_names, unnecessary_new, unnecessary_this, avoid_print, unused_element, prefer_const_constructors, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

late Color _shadedColor2;
late Color _shadedColor;

class CreditCardScreen extends StatefulWidget {
  final double width;
  const CreditCardScreen({required this.width, Key? key}) : super(key: key);

  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  bool _switchValue = true;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = true;
  double _colorSliderPosition = 260.0;
  double _colorSliderPosition2 = 309.0;
  late double _shadeSliderPosition;
  late double _shadeSliderPosition2;
  late Color _currentColor;
  late Color _currentColor2;
  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<Color> _colors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 128, 0),
    const Color.fromARGB(255, 255, 255, 0),
    const Color.fromARGB(255, 128, 255, 0),
    const Color.fromARGB(255, 0, 255, 0),
    const Color.fromARGB(255, 0, 255, 128),
    const Color.fromARGB(255, 0, 255, 255),
    const Color.fromARGB(255, 0, 128, 255),
    const Color.fromARGB(255, 0, 0, 255),
    const Color.fromARGB(255, 127, 0, 255),
    const Color.fromARGB(255, 255, 0, 255),
    const Color.fromARGB(255, 255, 0, 127),
    // const Color.fromARGB(255, 128, 128, 128),
  ];
  @override
  void initState() {
    border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 1));
    _currentColor = _calculateSelectedColor(_colorSliderPosition);
    _currentColor2 = _calculateSelectedColor2(_colorSliderPosition2);
    _shadeSliderPosition = widget.width / 2; //center the shader selector
    _shadeSliderPosition2 = widget.width / 2; //center the shader selector
    _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    _shadedColor2 = _calculateShadedColor2(_shadeSliderPosition2);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _colorChangeHandler(double position) {
    //handle out of bounds positions
    if (position > widget.width - defaultPadding * 2) {
      position = widget.width - defaultPadding * 2;
    }
    if (position < 0) {
      position = 0;
    }
    print("New pos: $position");
    setState(() {
      _colorSliderPosition = position;
      _currentColor = _calculateSelectedColor(_colorSliderPosition);
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
    });
  }

  _shadeChangeHandler(double position) {
    //handle out of bounds gestures
    if (position > widget.width) position = widget.width;
    if (position < 0) position = 0;
    setState(() {
      _shadeSliderPosition = position;
      _shadedColor = _calculateShadedColor(_shadeSliderPosition);
      print(
          "r: ${_shadedColor.red}, g: ${_shadedColor.green}, b: ${_shadedColor.blue}");
    });
  }

  Color _calculateShadedColor(double position) {
    double ratio = position / widget.width;
    if (ratio > 0.5) {
      //Calculate  color (values converge to 255 to make the color lighter)
      int redVal = _currentColor.red != 255
          ? (_currentColor.red +
                  (255 - _currentColor.red) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int greenVal = _currentColor.green != 255
          ? (_currentColor.green +
                  (255 - _currentColor.green) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int blueVal = _currentColor.blue != 255
          ? (_currentColor.blue +
                  (255 - _currentColor.blue) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate  color (values converge to 0 to make the color darker)
      int redVal = _currentColor.red != 0
          ? (_currentColor.red * ratio / 0.5).round()
          : 0;
      int greenVal = _currentColor.green != 0
          ? (_currentColor.green * ratio / 0.5).round()
          : 0;
      int blueVal = _currentColor.blue != 0
          ? (_currentColor.blue * ratio / 0.5).round()
          : 0;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      //return the base color
      return _currentColor;
    }
  }

  Color _calculateSelectedColor(double position) {
    //determine color
    double positionInColorArray =
        (position / widget.width * (_colors.length - 1));
    print(positionInColorArray);
    int index = positionInColorArray.truncate();
    print(index);
    double remainder = positionInColorArray - index;
    if (remainder == 0.0) {
      _currentColor = _colors[index];
    } else {
      //calculate  color
      int redValue = _colors[index].red == _colors[index + 1].red
          ? _colors[index].red
          : (_colors[index].red +
                  (_colors[index + 1].red - _colors[index].red) * remainder)
              .round();
      int greenValue = _colors[index].green == _colors[index + 1].green
          ? _colors[index].green
          : (_colors[index].green +
                  (_colors[index + 1].green - _colors[index].green) * remainder)
              .round();
      int blueValue = _colors[index].blue == _colors[index + 1].blue
          ? _colors[index].blue
          : (_colors[index].blue +
                  (_colors[index + 1].blue - _colors[index].blue) * remainder)
              .round();
      _currentColor = Color.fromARGB(255, redValue, greenValue, blueValue);
    }
    return _currentColor;
  }

  _colorChangeHandler2(double position2) {
    //handle out of bounds positions
    if (position2 > widget.width - defaultPadding * 2) {
      position2 = widget.width - defaultPadding * 2;
    }
    if (position2 < 0) {
      position2 = 0;
    }
    print("New pos: $position2");
    setState(() {
      _colorSliderPosition2 = position2;
      _currentColor2 = _calculateSelectedColor2(_colorSliderPosition2);
      _shadedColor2 = _calculateShadedColor2(_shadeSliderPosition);
    });
  }

  _shadeChangeHandler2(double position2) {
    //handle out of bounds gestures
    if (position2 > widget.width) position2 = widget.width;
    if (position2 < 0) position2 = 0;
    setState(() {
      _shadeSliderPosition = position2;
      _shadedColor = _calculateShadedColor2(_shadeSliderPosition);
      print(
          "r: ${_shadedColor.red}, g: ${_shadedColor.green}, b: ${_shadedColor.blue}");
    });
  }

  Color _calculateShadedColor2(double position2) {
    double ratio = position2 / widget.width;
    if (ratio > 0.5) {
      //Calculate  color (values converge to 255 to make the color lighter)
      int redVal = _currentColor2.red != 255
          ? (_currentColor2.red +
                  (255 - _currentColor2.red) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int greenVal = _currentColor2.green != 255
          ? (_currentColor2.green +
                  (255 - _currentColor2.green) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      int blueVal = _currentColor2.blue != 255
          ? (_currentColor2.blue +
                  (255 - _currentColor2.blue) * (ratio - 0.5) / 0.5)
              .round()
          : 255;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (ratio < 0.5) {
      //Calculate  color (values converge to 0 to make the color darker)
      int redVal = _currentColor2.red != 0
          ? (_currentColor2.red * ratio / 0.5).round()
          : 0;
      int greenVal = _currentColor2.green != 0
          ? (_currentColor2.green * ratio / 0.5).round()
          : 0;
      int blueVal = _currentColor2.blue != 0
          ? (_currentColor2.blue * ratio / 0.5).round()
          : 0;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      //return the base color
      return _currentColor2;
    }
  }

  Color _calculateSelectedColor2(double position2) {
    //determine color
    double positionInColorArray =
        (position2 / widget.width * (_colors.length - 1));
    print(positionInColorArray);
    int index = positionInColorArray.truncate();
    print(index);
    double remainder = positionInColorArray - index;
    if (remainder == 0.0) {
      _currentColor2 = _colors[index];
    } else {
      //calculate  color
      int redValue = _colors[index].red == _colors[index + 1].red
          ? _colors[index].red
          : (_colors[index].red +
                  (_colors[index + 1].red - _colors[index].red) * remainder)
              .round();
      int greenValue = _colors[index].green == _colors[index + 1].green
          ? _colors[index].green
          : (_colors[index].green +
                  (_colors[index + 1].green - _colors[index].green) * remainder)
              .round();
      int blueValue = _colors[index].blue == _colors[index + 1].blue
          ? _colors[index].blue
          : (_colors[index].blue +
                  (_colors[index + 1].blue - _colors[index].blue) * remainder)
              .round();
      _currentColor2 = Color.fromARGB(255, redValue, greenValue, blueValue);
    }
    return _currentColor2;
  }

  @override
  Widget build(BuildContext context) {
    var cardBackground = AppTheme.isLightTheme
        ? Theme.of(context).backgroundColor
        : Colors.black;
    var ColorTheme = Theme.of(context);
    var TextTheme = Theme.of(context).textTheme;
    var MediaQueryWidth = MediaQuery.of(context).size.width;
    var MediaQueryHeight = MediaQuery.of(context).size.height;
    var inputDecoration = InputDecoration(
        filled: true,
        fillColor: ColorTheme.backgroundColor,
        hintStyle: TextTheme.subtitle2!.copyWith(fontSize: 16),
        labelStyle: TextTheme.subtitle2!.copyWith(fontSize: 16),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            borderSide: BorderSide(color: ColorTheme.primaryColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            borderSide: BorderSide(color: ColorTheme.dividerColor, width: 1)));
    return Scaffold(
      backgroundColor: cardBackground,
      appBar: AppBar(
        elevation: 0,
        leading: SplashIcon(
          icon:
              Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          size: 27,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add You First Card',
            style: TextTheme.headline1!.copyWith(fontSize: 20)),
        backgroundColor: cardBackground,
      ),
      body: Column(
        children: [
          Container(
            color: AppTheme.isLightTheme
                ? Theme.of(context).backgroundColor
                : cardBackground,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: defaultPadding - 10),
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return CreditCardWidget(
                      height: 250,
                      linearGradient: [_shadedColor, _shadedColor2],
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      /* backgroundImage: useBackgroundImage
                                      ? ConstanceData.cardBackground
                                      : null, */
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                            cardType: CardType.mastercard,
                            cardImage: const Icon(Icons.ac_unit, size: 0))
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, right: 16, bottom: 0),
                        child: Row(
                          children: [
                            Text("Wallet Name",
                                style: TextTheme.subtitle2!
                                    .copyWith(fontSize: 13)),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPadding,
                              bottom: 0,
                              left: defaultPadding,
                              right: defaultPadding),
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextTheme.headline1,
                              decoration: inputDecoration.copyWith(
                                  hintText: 'XXXXX XXXXX XXXXX'))),
                      CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Theme.of(context).primaryColor,
                          textColor: AppTheme.isLightTheme
                              ? Colors.black
                              : Colors.white,
                          cardNumberDecoration: inputDecoration.copyWith(
                              hintText: 'XXXX XXXX XXXX XXXX'),
                          expiryDateDecoration:
                              inputDecoration.copyWith(hintText: 'XX/XX'),
                          cvvCodeDecoration:
                              inputDecoration.copyWith(hintText: 'XXXX'),
                          cardHolderDecoration:
                              inputDecoration.copyWith(hintText: 'XXXXX XXXXX'),
                          onCreditCardModelChange: onCreditCardModelChange),
                      Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onHorizontalDragStart: (DragStartDetails details) {
                            print("_-------------------------STARTED DRAG");
                            _colorChangeHandler(details.localPosition.dx);
                          },
                          onHorizontalDragUpdate: (DragUpdateDetails details) {
                            _colorChangeHandler(details.localPosition.dx);
                          },
                          onTapDown: (TapDownDetails details) {
                            _colorChangeHandler(details.localPosition.dx);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: widget.width,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                gradient: LinearGradient(colors: _colors),
                              ),
                              child: CustomPaint(
                                painter: _SliderIndicatorPainter(
                                    _colorSliderPosition),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onHorizontalDragStart: (DragStartDetails details) {
                            print("_-------------------------STARTED DRAG");
                            _colorChangeHandler2(details.localPosition.dx);
                          },
                          onHorizontalDragUpdate: (DragUpdateDetails details) {
                            _colorChangeHandler2(details.localPosition.dx);
                          },
                          onTapDown: (TapDownDetails details) {
                            _colorChangeHandler2(details.localPosition.dx);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: widget.width,
                              height: 8,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius),
                                  gradient: LinearGradient(colors: _colors)),
                              child: CustomPaint(
                                painter: _SliderIndicatorPainter2(
                                    _colorSliderPosition2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          children: [
                            FlutterSwitch(
                              height: 23.0,
                              width: 50.0,
                              padding: 4.0,
                              toggleSize: 15.0,
                              activeColor: AppTheme.isLightTheme
                                  ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3)
                                  : Theme.of(context).backgroundColor,
                              inactiveColor: AppTheme.isLightTheme
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade800,
                              inactiveToggleColor: AppTheme.isLightTheme
                                  ? Colors.white
                                  : Colors.grey,
                              toggleColor: Theme.of(context).primaryColor,
                              borderRadius: defaultRadius,
                              value: _switchValue,
                              onToggle: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                            SizedBox(width: defaultPadding),
                            Text("Save this Card as Default",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 14)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding,
                            horizontal: defaultPadding * 3),
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawCircle(Offset(position, size.height / 2), 12.8,
        Paint()..color = Colors.black26);
    canvas.drawCircle(
        Offset(position, size.height / 2), 12, Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(position, size.height / 2), 9, Paint()..color = _shadedColor);
  }

  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}

class _SliderIndicatorPainter2 extends CustomPainter {
  final double position2;
  _SliderIndicatorPainter2(this.position2);
  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawCircle(Offset(position2, size.height / 2), 12.8,
        Paint()..color = Colors.black26);
    canvas.drawCircle(
        Offset(position2, size.height / 2), 12, Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(position2, size.height / 2), 9, Paint()..color = _shadedColor2);
  }

  @override
  bool shouldRepaint(_SliderIndicatorPainter2 old) {
    return true;
  }
}
