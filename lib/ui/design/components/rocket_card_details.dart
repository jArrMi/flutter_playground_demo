import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/models/rocket.dart';

class RocketCard extends StatelessWidget {
  final Rocket rocket;

  const RocketCard({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: rocket.images.isNotEmpty
                ? Image.network(rocket.images.first)
                : Image.asset('assets/images/rocket_hero_placeholder.png'),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  rocket.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  rocket.country,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12.0),
                Text(
                  rocket.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    );
  }
}
