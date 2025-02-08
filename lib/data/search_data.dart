import 'package:faker/faker.dart';

import '../schemas/user_schema.dart';
import 'dart:math';

final random = Random();

List<UserSearchData> userSearchData = [
  UserSearchData(
    userId: 1,
    userImagePath: 'assets/images/user/barchart.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 2,
    userImagePath: 'assets/images/user/lakers.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 3,
    userImagePath: 'assets/images/user/no_user.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 4,
    userImagePath: 'assets/images/user/nomard.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 5,
    userImagePath: 'assets/images/user/barchart.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 6,
    userImagePath: 'assets/images/user/lakers.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 7,
    userImagePath: 'assets/images/user/no_user.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
  UserSearchData(
    userId: 8,
    userImagePath: 'assets/images/user/nomard.jpg',
    userName: faker.person.name(),
    message: faker.lorem.sentence(),
    blueCheck: random.nextBool(),
    followerCount: random.nextInt(1000),
    isFollowing: random.nextBool(),
    isOnline: random.nextBool(),
  ),
];
