import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/models/launchpad.dart';

class LaunchpadCard extends StatelessWidget {
  final Launchpad launchpad;

  const LaunchpadCard({Key? key, required this.launchpad}) : super(key: key);

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
            child: launchpad.image.isNotEmpty
                ? Image.network(launchpad.image)
                : Image.asset('assets/images/launchpad_hero_placeholder.png'),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  launchpad.fullName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  launchpad.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${launchpad.region}, ${launchpad.locality}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12.0),
                Text(
                  launchpad.details,
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
