import 'package:flutter/material.dart';
import 'package:twitter_challenge/activity/widgets/activity_item.dart';
import 'package:twitter_challenge/widgets/custom_divider.dart';
import '../../schemas/activity_schema.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.activityData,
  });
  final List<ActivitySchema> activityData;

  @override
  Widget build(BuildContext context) {
    return activityData.isEmpty
        ? const Center(
            child: Text('No Content'),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return ActivityItemWidget(activity: activityData[index]);
            },
            separatorBuilder: (context, index) => const CustomDivider(),
            itemCount: activityData.length,
          );
  }
}
