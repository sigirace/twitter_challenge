import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class DynamicProfile extends StatelessWidget {
  const DynamicProfile({
    super.key,
    required this.userImagePaths,
  });

  final List<String> userImagePaths;

  @override
  Widget build(BuildContext context) {
    return userImagePaths.length == 1
        ? Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              userImagePaths[0],
            ),
          )
        : userImagePaths.length == 2
            ? Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset(userImagePaths[0], fit: BoxFit.cover),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset(userImagePaths[1], fit: BoxFit.cover),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset(userImagePaths[0], fit: BoxFit.cover),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset(userImagePaths[1], fit: BoxFit.cover),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset(userImagePaths[2], fit: BoxFit.cover),
                  ),
                ],
              );
  }
}
