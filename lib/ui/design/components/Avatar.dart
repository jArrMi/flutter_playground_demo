import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;

  const Avatar({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Image.network(
            imageUrl!,
            height: 100,
          )
        : Image.asset(
            'assets/images/rocket_launch.png',
            height: 100,
          );
  }
}
