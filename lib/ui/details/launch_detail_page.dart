import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/models/launch.dart';
import 'package:flutter_playrground_1/provider/launchpad_provider.dart';
import 'package:flutter_playrground_1/provider/rocket_provider.dart';
import 'package:flutter_playrground_1/utils/formatters.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchDetailPage extends StatefulWidget {
  final Launch launch;

  const LaunchDetailPage({required this.launch});

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
              widget.launch.links.patch.small != null
                  ? Image.network(
                      widget.launch.links.patch.small!,
                      height: 100,
                    )
                  : Image.asset(
                      'assets/images/rocket_launch.png',
                      height: 100,
                    ),
              const SizedBox(height: 10),
              Text(
                'Launch Date: ${widget.launch.date_local.formattedDate()}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              widget.launch.details != null
                  ? Text(
                      'Details: ${widget.launch.details}',
                      style: const TextStyle(fontSize: 16),
                    )
                  : Container(),
              const SizedBox(height: 10),
              Consumer<RocketProvider>(
                builder: (context, rocketProvider, child) {
                  if (rocketProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text(
                      'Rocket: ${rocketProvider.rocket != null ? rocketProvider.rocket!.name : 'Rocket Not Availaablle'}',
                      style: const TextStyle(fontSize: 16),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              Consumer<LaunchpadProvider>(
                builder: (context, launchpadProvider, child) {
                  if (launchpadProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text(
                      'Launchpad: ${launchpadProvider.launchpad != null ? launchpadProvider.launchpad!.name : 'Launchpad Not Available'}',
                      style: const TextStyle(fontSize: 16),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              widget.launch.links.wikipedia != null
                  ? TextButton(
                      onPressed: () {
                        _launchURL(widget.launch.links.wikipedia!);
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

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'Could not launch $url';
    }
  }
}
