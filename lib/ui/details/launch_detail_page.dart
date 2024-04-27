import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/models/launch.dart';

class LaunchDetailPage extends StatefulWidget {
  final Launch launch;

  LaunchDetailPage({required this.launch});

  @override
  _LaunchDetailPageState createState() => _LaunchDetailPageState();
}

class _LaunchDetailPageState extends State<LaunchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.launch.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Launch Date: ${widget.launch.date_local}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              widget.launch.links.patch != null
                  ? Image.network(
                      widget.launch.links.patch.small,
                      width: 100,
                      height: 100,
                    )
                  : Image.asset(
                      'assets/images/default_patch.png',
                      width: 100,
                      height: 100,
                    ),
              // replace with your default image path
              const SizedBox(height: 10),
              widget.launch.details != null
                  ? Text(
                      'Details: ${widget.launch.details}',
                      style: const TextStyle(fontSize: 16),
                    )
                  : Container(),
              const SizedBox(height: 10),
              Text(
                'Rocket: ${widget.launch.rocket}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Launchpad: ${widget.launch.launchpad}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              widget.launch.links.wikipedia != null
                  ? TextButton(
                      onPressed: () {
                        // Implement your function to open the link
                      },
                      child: const Text(
                        'Wikipedia Link',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
