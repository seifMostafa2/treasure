// ignore_for_file: prefer_final_fields, empty_catches, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'demo_modell.dart';
import 'functions_country_all_picker.dart';
import 'sim_country_code.dart';

const TextStyle _defaultItemTextStyle = TextStyle(fontSize: 16);
const TextStyle _defaultSearchInputStyle = TextStyle(fontSize: 16);
const String _kDefaultSearchHintText = 'Search country name, code';
// const String countryCodePackageName = 'country_all_picker';

class CountryAllPicker extends StatefulWidget {
  final ValueChanged<Country>? onSelected;

  /// [itemTextStyle] can be used to change the TextStyle of the Text in ListItem. Default is [_defaultItemTextStyle]
  final TextStyle itemTextStyle;

  /// [searchInputStyle] can be used to change the TextStyle of the Text in SearchBox. Default is [searchInputStyle]
  final TextStyle searchInputStyle;

  /// [searchInputDecoration] can be used to change the decoration for SearchBox.
  final InputDecoration? searchInputDecoration;

  /// Flag icon size (width). Default set to 32.
  final double flagIconSize;

  ///Can be set to `true` for showing the List Separator. Default set to `false`
  final bool showSeparator;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool focusSearchBox;

  ///This will change the hint of the search box. Alternatively [searchInputDecoration] can be used to change decoration fully.
  final String searchHintText;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool searchBar;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool countryFlag;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool countryCode;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool countryName;

  ///Can be set to `true` for opening the keyboard automatically. Default set to `false`
  final bool currencyCode;

  ///Can be set to `false` for opening the keyboard automatically. Default set to `true`
  final bool currencyName;

  ///Can be set to `false` for opening the keyboard automatically. Default set to `true`
  final bool iso3Code;

  const CountryAllPicker({
    Key? key,
    this.onSelected,
    this.itemTextStyle = _defaultItemTextStyle,
    this.searchInputStyle = _defaultSearchInputStyle,
    this.searchInputDecoration,
    this.searchHintText = _kDefaultSearchHintText,
    this.flagIconSize = 32,
    this.showSeparator = false,
    this.focusSearchBox = false,
    this.searchBar = true,
    this.countryFlag = true,
    this.countryCode = true,
    this.countryName = true,
    this.currencyCode = false,
    this.currencyName = false,
    this.iso3Code = false,
  }) : super(key: key);

  @override
  @override
  _CountryAllPickerState createState() => _CountryAllPickerState();
}

class _CountryAllPickerState extends State<CountryAllPicker> {
  List<Country> _list = [];
  List<Country> _filteredList = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  Country? _currentCountry;

  void _onSearch(text) {
    if (text == null || text.isEmpty) {
      setState(() {
        _filteredList.clear();
        _filteredList.addAll(_list);
      });
    } else {
      setState(() {
        _filteredList = _list
            .where((element) =>
                element.name
                    .toLowerCase()
                    .contains(text.toString().toLowerCase()) ||
                element.callingCode
                    .toLowerCase()
                    .contains(text.toString().toLowerCase()) ||
                element.currencyCode
                    .toLowerCase()
                    .contains(text.toString().toLowerCase()) ||
                element.countryCode
                    .toLowerCase()
                    .startsWith(text.toString().toLowerCase()))
            .map((e) => e)
            .toList();
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    });
    loadList();
    super.initState();
  }

  void loadList() async {
    setState(() {
      _isLoading = true;
    });
    _list = await getCountries(context);
    try {
      String? code = await FlutterSimCountryCode.simCountryCode;
      _currentCountry =
          _list.firstWhere((element) => element.countryCode == code);
      final country = _currentCountry;
      if (country != null) {
        _list.removeWhere(
            (element) => element.callingCode == country.callingCode);
        _list.removeWhere(
            (element) => element.currencyCode == country.currencyCode);
        _list.removeWhere(
            (element) => element.currencyName == country.currencyName);
        _list.removeWhere((element) => element.iso3Code == country.iso3Code);
        _list.insert(0, country);
      }
    } catch (e) {
    } finally {
      setState(() {
        _filteredList = _list.map((e) => e).toList();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.searchBar
            ? Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                    style: widget.searchInputStyle,
                    autofocus: widget.focusSearchBox,
                    decoration: widget.searchInputDecoration ??
                        InputDecoration(
                            suffixIcon: Visibility(
                                visible: _controller.text.isNotEmpty,
                                child: InkWell(
                                    child: const Icon(Icons.clear),
                                    onTap: () => setState(() {
                                          _controller.clear();
                                          _filteredList.clear();
                                          _filteredList.addAll(_list);
                                        }))),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(30)),
                            contentPadding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            hintText: widget.searchHintText),
                    textInputAction: TextInputAction.done,
                    controller: _controller,
                    onChanged: _onSearch))
            : Container(),
        SizedBox(height: widget.searchBar ? 10 : 0),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Scrollbar(
                  controller: _scrollController,
                  showTrackOnHover: true,
                  isAlwaysShown: true,
                  radius: const Radius.circular(10),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 5),
                    controller: _scrollController,
                    itemCount: _filteredList.length,
                    separatorBuilder: (_, index) =>
                        widget.showSeparator ? const Divider() : Container(),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          widget.onSelected?.call(_filteredList[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 15, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(children: <Widget>[
                                widget.countryFlag
                                    ? Image.asset(_filteredList[index].flag,
                                        width: widget.flagIconSize)
                                    : const SizedBox(),
                                SizedBox(width: widget.countryFlag ? 13 : 0),
                                widget.countryName
                                    ? Expanded(
                                        child: Text(_filteredList[index].name,
                                            style: widget.itemTextStyle))
                                    : const SizedBox(),
                                SizedBox(width: widget.countryName ? 7 : 0),
                              ])),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  widget.countryCode
                                      ? Text(_filteredList[index].callingCode,
                                          style: widget.itemTextStyle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1)
                                      : const SizedBox(),
                                  SizedBox(width: widget.countryCode ? 7 : 0),
                                  widget.currencyName
                                      ? Text(_filteredList[index].currencyName,
                                          style: widget.itemTextStyle)
                                      : const SizedBox(),
                                  SizedBox(width: widget.currencyName ? 7 : 0),
                                  widget.currencyCode
                                      ? Text(
                                          _filteredList[index]
                                              .currencyCode
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: widget.itemTextStyle)
                                      : const SizedBox(),
                                  SizedBox(width: widget.currencyCode ? 7 : 0),
                                  widget.iso3Code
                                      ? Text(
                                          widget.currencyCode
                                              ? '(${_filteredList[index].iso3Code.toUpperCase()})'
                                              : _filteredList[index]
                                                  .iso3Code
                                                  .toUpperCase(),
                                          style: widget.itemTextStyle)
                                      : const SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
