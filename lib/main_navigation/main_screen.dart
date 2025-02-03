import 'package:flutter/cupertino.dart';
import 'package:twitter_challenge/main_navigation/widgets/post.dart';
import 'package:twitter_challenge/schemas.dart';

import '../constants/sizes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.size10,
      ),
      child: Column(
        children: [
          Post(
            postType: PostType.image,
            userImagePath: 'assets/images/user/nomard.jpg',
            userName: 'Nomard Coder',
            postContent:
                "늦게나마 펼처보는 지난 연말모임 현장....!!\n덕분에 훈훈했어요....🥰\n우리 또 자주 만나용 😚\n찐 개발자 커뮤니티는 #노마드코더 라능 😌\n.\n#개발자모임\n#커뮤니티 #커뮤니티의힘\n#여러분감사합니다❤️",
            imagePaths: [
              'assets/images/post/nomard_post_2_1.jpg',
              'assets/images/post/nomard_post_2_2.jpg',
              'assets/images/post/nomard_post_2_3.jpg',
              'assets/images/post/nomard_post_2_4.jpg',
            ],
            replyCount: 10,
            likeCount: 100,
          ),
        ],
      ),
    );
  }
}
