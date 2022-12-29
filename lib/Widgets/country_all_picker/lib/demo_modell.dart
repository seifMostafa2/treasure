class Country {
  final String name;
  final String flag;
  final String countryCode;
  final String callingCode;
  final String currencyCode;
  final String currencyName;
  final String iso3Code;

  const Country(this.name, this.flag, this.countryCode, this.callingCode,
      this.currencyCode, this.currencyName, this.iso3Code);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['name'] as String,
      json['flag'] as String,
      json['country_code'] as String,
      json['calling_code'] as String,
      json['currency_code'] as String,
      json['currency_name'] as String,
      json['iso3Code'] as String,
    );
  }
}
