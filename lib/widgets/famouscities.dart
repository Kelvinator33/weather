import 'package:flutter/material.dart';
import 'package:weather/widgets/citytiles.dart';

import '../screens/detail.dart';

class famouscities extends StatelessWidget {
  const famouscities({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: f_cities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = f_cities[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => detailscreen(
                  city: city.name,
                ),
              ),
            );
          },
          child: citytile(
            index: index,
            city: city.name,
          ),
        );
      },
    );
  }
}

class f_city {
  final String name;
  final double lat;
  final double lon;

  const f_city({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant
List<f_city> f_cities = const [
  f_city(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  f_city(name: 'New Delhi', lat: 28.5833, lon: 77.2),
  f_city(name: 'London', lat: 51.4833, lon: -0.0833),
  f_city(name: 'Tehran', lat: 35.6833, lon: 51.4167),
  f_city(name: 'New York', lat: 40.7167, lon: -74.0167),
  f_city(name: 'Copenhagen', lat: 55.68, lon: 12.57)
];
