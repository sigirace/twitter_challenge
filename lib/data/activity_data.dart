import 'package:faker/faker.dart';

import '../schemas/activity_schema.dart';
import 'dart:math';

final random = Random();

final List<String> activityTabs = [
  "All",
  "Replies",
  "Mentions",
  "Share",
  "Follow",
  "Likes",
];

final List<ActivitySchema> activityData = [
  ActivitySchema(
    activtyId: "1",
    activityType: "Mentions",
    userProfileImage: "assets/images/user/nomard.jpg",
    userName: faker.person.name(),
    subTitle: "Mentioned you",
    additionalInfo: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "2",
    activityType: "Share",
    userProfileImage: "assets/images/user/lakers.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    additionalInfo: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "3",
    activityType: "Follow",
    userProfileImage: "assets/images/user/no_user.jpg",
    userName: faker.person.name(),
    subTitle: "Followed you",
    isFollowing: true,
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "4",
    activityType: "Likes",
    userProfileImage: "assets/images/user/barchart.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "5",
    activityType: "Likes",
    userProfileImage: "assets/images/user/nomard.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "6",
    activityType: "Mentions",
    userProfileImage: "assets/images/user/nomard.jpg",
    userName: faker.person.name(),
    subTitle: "Mentioned you",
    additionalInfo: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "7",
    activityType: "Share",
    userProfileImage: "assets/images/user/lakers.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    additionalInfo: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "8",
    activityType: "Follow",
    userProfileImage: "assets/images/user/no_user.jpg",
    userName: faker.person.name(),
    subTitle: "Followed you",
    isFollowing: true,
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "9",
    activityType: "Likes",
    userProfileImage: "assets/images/user/barchart.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
  ActivitySchema(
    activtyId: "10",
    activityType: "Likes",
    userProfileImage: "assets/images/user/nomard.jpg",
    userName: faker.person.name(),
    subTitle: faker.lorem.sentence(),
    time: Random().nextInt(10),
  ),
];
