import 'package:flutter/material.dart';
import 'package:twitter_challenge/activity/widgets/activity.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';
import '../data/activity_data.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: activityTabs.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Activity',
            style: TextStyle(
              fontSize: FontSize.fs28,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          splashFactory: NoSplash.splashFactory,
          dividerColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: Width.w4),
          indicator: const BoxDecoration(),
          tabs: [
            for (var tab in activityTabs)
              Container(
                width: Width.w100,
                height: Height.h30,
                decoration: tabController.index == activityTabs.indexOf(tab)
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size8),
                        color: Colors.black,
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size8),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: tabController.index == activityTabs.indexOf(tab)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: Sizes.size16),
        child: TabBarView(
          controller: tabController,
          children: [
            ActivityWidget(
              activityData: activityData,
            ),
            for (var tab in activityTabs.skip(1))
              ActivityWidget(
                activityData: activityData
                    .where((element) => element.activityType == tab)
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
