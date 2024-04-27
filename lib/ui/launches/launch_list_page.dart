import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/provider/launch_provider.dart';
import 'package:flutter_playrground_1/ui/details/launch_detail_page.dart';
import 'package:provider/provider.dart';

class LaunchListPage extends StatelessWidget {
  const LaunchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launch List'),
      ),
      body: Consumer<LaunchProvider>(
        builder: (context, launchProvider, child) {
          if (launchProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: launchProvider.launches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(launchProvider.launches[index].name),
                  subtitle: Text(launchProvider.launches[index].date_utc),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              LaunchDetailPage(
                                launch: launchProvider.launches[index],
                              ),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation1),
                              child: child,
                            );
                          }),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}