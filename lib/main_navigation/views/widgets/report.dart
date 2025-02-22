import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/fontsize.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../data/report_reason.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size20),
          topRight: Radius.circular(Sizes.size20),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why ar you reporting this thread?',
                    style: TextStyle(
                      fontSize: FontSize.fs14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    'Your report is anonymous, except if you`re reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - dont` wait.',
                    style: TextStyle(
                      fontSize: FontSize.fs13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: reportReasons.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        reportReasons[index],
                        style: TextStyle(
                          fontSize: FontSize.fs14,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.angleRight,
                        size: FontSize.fs14,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
