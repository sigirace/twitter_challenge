import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    _textController.addListener(() {
      if (_textController.selection.end == _textController.text.length) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size20),
          topRight: Radius.circular(Sizes.size20),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: Width.w52,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: FontSize.fs13,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            title: const Text(
              "New thread",
            ),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: Sizes.size20,
                              backgroundImage: AssetImage(
                                "assets/images/user/lakers.jpg",
                              ),
                            ),
                            Gaps.v10,
                            Expanded(
                              child: Container(
                                width: Sizes.size2,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Gaps.v10,
                            const FaIcon(
                              FontAwesomeIcons.clipboard,
                              size: Sizes.size20,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lakers",
                                style: TextStyle(
                                  fontSize: FontSize.fs13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextField(
                                controller: _textController,
                                autocorrect: false,
                                focusNode: _focusNode,
                                maxLines: null,
                                minLines: null,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  hintText: 'Start a thread...',
                                  hintStyle: TextStyle(
                                    fontSize: FontSize.fs13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                              Gaps.v10,
                              const FaIcon(
                                FontAwesomeIcons.paperclip,
                                size: Sizes.size20,
                                color: Colors.grey,
                              ),
                              Gaps.v30,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v45,
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size18,
              vertical: Sizes.size16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Anyone can reply',
                  style: TextStyle(
                    fontSize: FontSize.fs12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: FontSize.fs14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
