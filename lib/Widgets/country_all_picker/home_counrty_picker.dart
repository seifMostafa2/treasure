// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';

import 'lib/country_all_picker_.dart';
import 'lib/demo_modell.dart';
import 'lib/functions_country_all_picker.dart';

class HomeCounrtyPicker extends StatefulWidget {
  const HomeCounrtyPicker({Key? key}) : super(key: key);

  @override
  _HomeCounrtyPickerState createState() => _HomeCounrtyPickerState();
}

class _HomeCounrtyPickerState extends State<HomeCounrtyPicker> {
  Country? _selectedCountry;

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

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Calling Code Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            country == null
                ? Container()
                : Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 16,
                      ),
                      Image.asset(country.flag),
                      Text(
                        '${country.countryCode}, ${country.callingCode} ${country.name} ${country.currencyCode}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
            const SizedBox(height: 100),
            MaterialButton(
              child: const Text('Final Country Picker'),
              color: Colors.amber,
              onPressed: _finalCountryPicker,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              child: const Text('Select Country using bottom sheet'),
              color: Colors.orange,
              onPressed: _onPressedShowBottomSheet,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              child: const Text('Select Country using dialog'),
              color: Colors.deepOrangeAccent,
              onPressed: _onPressedShowDialog,
            ),
          ],
        ),
      ),
    );
  }

  void _finalCountryPicker() async {
    final country =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DemoPickerPage();
    }));
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  void _onPressedShowDialog() async {
    final country = await showCountryPickerDialog(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}

class DemoPickerPage extends StatelessWidget {
  const DemoPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color)),
          title: const Text('Counrty/Region')),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
              child: CountryAllPicker(
                  searchInputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Theme.of(context).dividerColor)),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Type name here",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: const OutlineInputBorder(
                          borderRadius:
                               BorderRadius.all(Radius.circular(15)))),
                  onSelected: (country) => Navigator.pop(context, country)))
        ],
      ),
    );
  }
}
