import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/main_navigation/view_models/post_screen_view_model.dart';
import 'package:twitter_challenge/main_navigation/view_models/post_view_model.dart';
import 'package:twitter_challenge/media/Image_picker_screen.dart';
import 'package:twitter_challenge/media/widgets/post_image.dart';
import 'package:twitter_challenge/users/view_models/user_view_model.dart';

import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  bool isLoading = false;
  String? _selectedImagePath;
  XFile? file;

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

  Future<void> _onMediaPost() async {
    file = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImagePickerScreen(),
        fullscreenDialog: true,
      ),
    );

    if (file != null) {
      _selectedImagePath = file!.path;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _removeImage() {
    setState(() {
      _selectedImagePath = null;
    });
  }

  Future<void> _onPost() async {
    setState(() {
      isLoading = true;
    });
    await ref.read(postViewModel.notifier).uploadPost(
          content: _textController.text,
          image: file != null ? File(file!.path) : null,
        );
    await ref.read(postScreenViewModel.notifier).refresh();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
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
            child: Stack(
              children: [
                Column(
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
                                CircleAvatar(
                                  radius: Sizes.size20,
                                  backgroundImage: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/tiktok-sigi.firebasestorage.app/o/avatars%2F${ref.watch(userProvider).value?.uid}?alt=media&token=468a64af-7f46-46be-99ba-b01f9d06038b",
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
                                    ref.watch(userProvider).value?.name ?? "",
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
                                  if (_selectedImagePath != null)
                                    PostImage(
                                      imagePath: _selectedImagePath!,
                                      callback: _removeImage,
                                    ),
                                  Gaps.v10,
                                  Gaps.v10,
                                  GestureDetector(
                                    onTap: _onMediaPost,
                                    child: const FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      size: Sizes.size20,
                                      color: Colors.grey,
                                    ),
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
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ),
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
                  onTap: _onPost,
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
