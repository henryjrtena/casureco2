import 'package:casureco/classes/notification_handler.dart';
import 'package:casureco/extensions/context_texttheme_ext.dart';
import 'package:casureco/extensions/feeder_status_ext.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';

class FeederDetails extends StatelessWidget {
  const FeederDetails({
    required this.feeder,
    required this.subscribeFeeders,
    required this.onSubscribed,
    super.key,
  });

  final Feeder? feeder;
  final ValueChanged<String> onSubscribed;
  final List<String> subscribeFeeders;

  @override
  Widget build(BuildContext context) {
    final feederId = feeder?.id?.toString() ?? emptyString;
    final isSubscribed = subscribeFeeders.contains(feederId);
    final bulletStatus = FeederStatus.values[feeder?.status ?? defaultZero];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 1.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                height: 180.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              feeder?.name ?? emptyString,
                              style: context.titleLarge,
                            ),
                            SizedBox(width: 5.0),
                            Container(
                              height: 15.0,
                              width: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bulletStatus.color,
                              ),
                            )
                          ],
                        ),
                        FilledButton(
                          style: ElevatedButton.styleFrom(backgroundColor: blue),
                          onPressed: () async {
                            onSubscribed.call(feederId);
                            await NotificationHandler.showNotification(
                              title: 'First Notifications',
                              body: 'with Awesome Notification',
                              scheduled: true,
                              interval: 5,
                            );
                          },
                          child: Text(isSubscribed ? 'Unsubscribe' : 'Subscribe'),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          feeder?.areas ?? emptyString,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feeder?.updates?.length, // Replace with your desired item count
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
