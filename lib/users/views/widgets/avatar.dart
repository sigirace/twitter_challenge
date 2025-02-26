import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/users/view_models/avatar_view_model.dart';

class Avatar extends ConsumerWidget {
  final bool hasAvatar;
  final String uid;
  const Avatar({
    super.key,
    required this.hasAvatar,
    required this.uid,
  });

  Future<void> _onAvatarTap(BuildContext context, WidgetRef ref) async {
    final xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 150,
      maxWidth: 150,
    );
    if (xfile != null) {
      final file = File(xfile.path);
      ref.read(avatarViewModel.notifier).updateAvatar(file);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(avatarViewModel).isLoading;
    return GestureDetector(
      onTap: isLoading ? null : () => _onAvatarTap(context, ref),
      child: isLoading
          ? Container(
              width: Sizes.size56,
              height: Sizes.size56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: const CircularProgressIndicator.adaptive(),
            )
          : CircleAvatar(
              radius: Sizes.size36,
              backgroundImage: hasAvatar
                  ? NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/tiktok-sigi.firebasestorage.app/o/avatars%2F$uid?alt=media&token=468a64af-7f46-46be-99ba-b01f9d06038b&haha=${DateTime.now().toString()}",
                    )
                  : null,
              child: !hasAvatar
                  ? FaIcon(
                      FontAwesomeIcons.user,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                  : null,
            ),
    );
  }
}
