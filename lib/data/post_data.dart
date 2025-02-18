import '../schemas/post_schema.dart';

const String baseImagePath = 'assets/images/user';

final List<PostData> postData = [
  PostData(
    postId: '2',
    userImagePath: '$baseImagePath/barchart.jpg',
    userName: 'barchart',
    postContent:
        'BREAKING NEWS 🚨: China will impose tariffs of up to 15% on US oil, gas, coal, and agricultural equipment  ',
    replyCount: 1,
    likeCount: 0,
    likeUserImagePaths: ['$baseImagePath/no_user.jpg'],
    postType: PostType.text,
  ),
  PostData(
    postId: '3',
    userImagePath: '$baseImagePath/lakers.jpg',
    userName: 'lakers',
    postContent: 'OFFICIAL: Welcome to the squad, Maxi!',
    replyCount: 10,
    likeCount: 2,
    imagePaths: [
      'assets/images/post/lakers_post_1.jpg',
    ],
    likeUserImagePaths: [
      '$baseImagePath/nomard.jpg',
      '$baseImagePath/barchart.jpg',
    ],
    postType: PostType.image,
  ),
  PostData(
    postId: '4',
    userImagePath: '$baseImagePath/barchart.jpg',
    userName: 'barchart',
    postContent:
        'U.S. Dollar Index DXY absolutely ripping as it approaches its highest level since November 2022',
    replyCount: 2,
    likeCount: 1,
    imagePaths: [
      'assets/images/post/barchart_post_1.jpg',
    ],
    likeUserImagePaths: [
      '$baseImagePath/nomard.jpg',
    ],
    postType: PostType.image,
  ),
  PostData(
    postId: '5',
    userImagePath: '$baseImagePath/lakers.jpg',
    userName: 'lakers',
    postContent: 'Primetime',
    replyCount: 500,
    likeCount: 100,
    imagePaths: [
      'assets/images/post/lakers_post_3_1.jpg',
      'assets/images/post/lakers_post_3_2.jpg',
      'assets/images/post/lakers_post_3_3.jpg',
      'assets/images/post/lakers_post_3_4.jpg',
    ],
    likeUserImagePaths: [
      '$baseImagePath/nomard.jpg',
      '$baseImagePath/barchart.jpg',
      '$baseImagePath/no_user.jpg',
    ],
    postType: PostType.image,
  ),
  PostData(
    postId: '6',
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
  PostData(
    postId: '7',
    userImagePath: '$baseImagePath/barchart.jpg',
    userName: 'barchart',
    postContent:
        'BREAKING 🚨: Canada \n\nCanadian Dollar plunges to its weakest level against the U.S. Dollar in more than 20 years',
    replyCount: 1,
    likeCount: 2,
    imagePaths: [
      'assets/images/post/barchart_post_2.jpg',
    ],
    likeUserImagePaths: [
      '$baseImagePath/lakers.jpg',
      '$baseImagePath/no_user.jpg',
    ],
    postType: PostType.image,
  ),
  PostData(
    postId: '8',
    userImagePath: '$baseImagePath/lakers.jpg',
    userName: 'lakers',
    postContent: 'Can`t spell Luka without LA',
    replyCount: 300,
    likeCount: 200,
    likeUserImagePaths: [
      '$baseImagePath/barchart.jpg',
      '$baseImagePath/lakers.jpg',
      '$baseImagePath/no_user.jpg',
    ],
    imagePaths: [
      'assets/images/post/lakers_post_2_1.jpg',
      'assets/images/post/lakers_post_2_2.jpg',
      'assets/images/post/lakers_post_2_3.jpg',
    ],
    postType: PostType.image,
  ),
];
