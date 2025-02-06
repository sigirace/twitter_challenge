import 'package:flutter/material.dart';
import 'package:twitter_challenge/main_navigation/widgets/report.dart';

import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class EllipsisTab extends StatefulWidget {
  const EllipsisTab({super.key});

  @override
  State<EllipsisTab> createState() => _EllipsisTabState();
}

class _EllipsisTabState extends State<EllipsisTab> {
  void _onReportTap() {
    Navigator.pop(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const Report(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.36,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size20),
          topRight: Radius.circular(Sizes.size20),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size30,
        vertical: Sizes.size30,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Sizes.size20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size18,
                            top: Sizes.size18,
                            bottom: Sizes.size12,
                          ),
                          child: Text(
                            'Unfollow',
                            style: TextStyle(
                              fontSize: FontSize.fs12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size18,
                            top: Sizes.size12,
                            bottom: Sizes.size18,
                          ),
                          child: Text(
                            'Mute',
                            style: TextStyle(
                              fontSize: FontSize.fs12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v10,
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Sizes.size20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size18,
                            top: Sizes.size18,
                            bottom: Sizes.size12,
                          ),
                          child: Text(
                            'Hide',
                            style: TextStyle(
                              fontSize: FontSize.fs12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: _onReportTap,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size18,
                            top: Sizes.size12,
                            bottom: Sizes.size18,
                          ),
                          child: Text(
                            'Report',
                            style: TextStyle(
                              fontSize: FontSize.fs12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
