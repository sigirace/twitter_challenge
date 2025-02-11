import 'package:faker/faker.dart';

import '../schemas/post_schema.dart';

final List<PostData> replyData = [
  PostData(
    postId: '1',
    userImagePath: 'assets/images/user/barchart.jpg',
    userName: 'barchart',
    postContent: faker.lorem.sentence(),
    replyCount: 100,
    likeCount: 100,
    likeUserImagePaths: [],
    postType: PostType.text,
    replyData: ReplyData(
      replyId: '1',
      userImagePath: 'assets/images/user/nomard.jpg',
      userName: 'nomard',
      replyContent: faker.lorem.sentence(),
    ),
  ),
  PostData(
    postId: '2',
    userImagePath: 'assets/images/user/lakers.jpg',
    userName: 'lakers',
    postContent: faker.lorem.sentence(),
    replyCount: 100,
    likeCount: 100,
    likeUserImagePaths: [],
    postType: PostType.innerPost,
    innerPostData: InnerPostData(
      postId: '1',
      userImagePath: 'assets/images/user/barchart.jpg',
      userName: 'barchart',
      postContent: faker.lorem.sentence(),
      imagePaths: [
        'assets/images/post/barchart_post_1.jpg',
        'assets/images/post/barchart_post_2.jpg',
      ],
      postType: InnerPostType.image,
      replyCount: 100,
    ),
    replyData: ReplyData(
      replyId: '1',
      userImagePath: 'assets/images/user/nomard.jpg',
      userName: 'nomard',
      replyContent: faker.lorem.sentence(),
    ),
  ),
];
