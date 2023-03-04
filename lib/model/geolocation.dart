class Geolocation {
  Geolocation({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.countryCode,
    this.timezone,
    this.population,
    this.country,
    this.admin1,
  });

  factory Geolocation.fromJson(Map<String, dynamic> geolocation) {
    final id = geolocation["id"];
    final name = geolocation["name"];
    final latitude = geolocation["latitude"];
    final longitude = geolocation["longitude"];
    final countryCode = geolocation["country_code"];
    final timezone = geolocation["timezone"];
    final population = geolocation["population"];
    final country = geolocation["country"];
    final admin1 = geolocation["admin1"];

    return Geolocation(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      countryCode: countryCode,
      timezone: timezone,
      population: population,
      country: country,
      admin1: admin1,
    );
  }

  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final String? countryCode;
  final String? timezone;
  final int? population;
  final String? country;
  final String? admin1;
}
