import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/provider/base/launch_provider.dart';
import 'package:flutter_playrground_1/provider/past_launch_provider.dart';
import 'package:flutter_playrground_1/provider/upcoming_launch_provider.dart';
import 'package:flutter_playrground_1/ui/details/launch_detail_page.dart';
import 'package:flutter_playrground_1/utils/formatters.dart';
import 'package:provider/provider.dart';

class LaunchListPage extends StatelessWidget {
  const LaunchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Launch List'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Past Launches'),
              Tab(text: 'Upcoming Launches'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLaunchList<PastLaunchProvider>(),
            _buildLaunchList<UpcomingLaunchProvider>(),
          ],
        ),
      ),
    );
  }

  Widget _buildLaunchList<T extends LaunchProvider>() {
    return Consumer<T>(
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
                        child:  launch.links.patch.small != null
                            ? Image.network(
                          launch.links.patch.small!,
                          width: 100,
                          height: 100,
                        )
                            : Image.asset(
                          'assets/images/rocket_launch.png',
                          width: 100,
                          height: 100,
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
    );
  }
}
