import 'package:casureco/extensions/context_texttheme_ext.dart';
import 'package:casureco/extensions/feeder_status_ext.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedersGridView extends StatelessWidget {
  const FeedersGridView({
    required this.feeders,
    required this.subscribesTo,
    this.isAllFeeders = false,
    super.key,
  });

  final List<Feeder> feeders;
  final List<String> subscribesTo;
  final bool isAllFeeders;

  @override
  Widget build(BuildContext context) {

    final subscribeFeeders = List<Feeder>.from([]);

    if(!isAllFeeders){
      for(final feeder in feeders){
        if(subscribesTo.contains(feeder.id.toString())){
          subscribeFeeders.add(feeder);
        }
      }
    }
    else{
      subscribeFeeders.addAll(feeders);
    }

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final feeder = subscribeFeeders[index];
        final bulletStatus = FeederStatus.values[feeder.status ?? defaultZero];
        return GestureDetector(
          child: Card(
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    feeder.name ?? emptyString,
                    style: context.titleMedium,
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
            ),
          ),
          onTap: () {
            context.go(
              '/feeders/feeder-details',
              extra: feeder,
            );
          },
        );
      },
      itemCount: subscribeFeeders.length,
    );
  }
}
