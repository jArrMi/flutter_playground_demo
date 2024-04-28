import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/provider/launch_provider.dart';
import 'package:flutter_playrground_1/ui/details/launch_detail_page.dart';
import 'package:flutter_playrground_1/utils/formatters.dart';
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        launchProvider.launches[index].date.toFormattedString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...launchProvider.launches[index].launches.map((launch) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            launch.links.patch.small,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(launch.name),
                        subtitle: Text(launch.date_utc.formattedDate()),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) =>
                                    LaunchDetailPage(
                                      launch: launch,
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
                    }).toList(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
