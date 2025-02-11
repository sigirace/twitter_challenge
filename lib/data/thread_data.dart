import '../schemas/post_schema.dart';
import 'package:faker/faker.dart';
import '../schemas/user_schema.dart';

final UserProfileData userProfileData = UserProfileData(
  userId: 1,
  userImagePath: 'assets/images/user/nomard.jpg',
  userName: 'Nomard Coder',
  fullName: 'Nicolas',
  message: 'Best Teacher!',
  followerCount: 100,
  followerImagePaths: [
    'assets/images/user/barchart.jpg',
    'assets/images/user/lakers.jpg',
  ],
);

const String baseImagePath = 'assets/images/user/';
final List<PostData> threadData = [
  PostData(
    postId: '1',
    userImagePath: '$baseImagePath/nomard.jpg',
    userName: 'Nomard Coder',
    postContent:
        'Give a follow if you want to learn more about coding and programming!',
    replyCount: 100,
    likeCount: 100,
    likeUserImagePaths: [
      '$baseImagePath/barchart.jpg',
      '$baseImagePath/lakers.jpg',
      '$baseImagePath/no_user.jpg',
    ],
    postType: PostType.text,
  ),
  PostData(
    postId: '2',
    userImagePath: '$baseImagePath/nomard.jpg',
    userName: 'Nomard Coder',
    postContent: 'Tea. Spilage. Lakers. 🥰',
    replyCount: 1,
    likeCount: 0,
    likeUserImagePaths: [
      '$baseImagePath/no_user.jpg',
    ],
    postType: PostType.innerPost,
    innerPostData: InnerPostData(
      postId: '3',
      userImagePath: '$baseImagePath/lakers.jpg',
      userName: 'lakers',
      postContent: faker.lorem.sentence(),
      imagePaths: [
        'assets/images/post/lakers_post_1.jpg',
      ],
      postType: InnerPostType.image,
      replyCount: 100,
    ),
  ),
  PostData(
    postId: '4',
    userImagePath: '$baseImagePath/nomard.jpg',
    userName: 'Nomard Coder',
    postContent: '따습한 성탄절 되세요 🥰\n메리 크리스마스 💖',
    replyCount: 999,
    likeCount: 999,
    imagePaths: [
      'assets/images/post/nomard_post_1.jpg',
    ],
    likeUserImagePaths: [
      '$baseImagePath/barchart.jpg',
      '$baseImagePath/lakers.jpg',
      '$baseImagePath/no_user.jpg',
    ],
    postType: PostType.image,
  ),
];
