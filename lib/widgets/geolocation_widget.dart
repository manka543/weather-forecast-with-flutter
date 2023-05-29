import 'package:flutter/material.dart';
import 'package:weather_forecast/model/geolocation.dart';

class Location extends StatelessWidget {
  const Location({super.key, required this.geolocation});
  final Geolocation geolocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                        text: "${geolocation.name}, ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                        ),
                        children: [
                      TextSpan(
                          text: "${geolocation.admin1}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 15,
                          )),
                    ]))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.people_alt_rounded),
                Text(geolocation.population != null ? geolocation.population.toString() : "-"),
                const Icon(Icons.place),
                Text(
                    "${geolocation.latitude!.abs().toString().substring(0, 5)}${geolocation.latitude != null && geolocation.latitude! > 0 ? "N" : "S"}, ${geolocation.longitude!.abs().toString().substring(0, 5)}${geolocation.longitude != null && geolocation.longitude! > 0 ? "E" : "W"}"),
                const Icon(Icons.watch_later_outlined),
                Text(geolocation.timezone.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
