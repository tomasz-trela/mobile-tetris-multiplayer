import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/gen/assets.gen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final VoidCallback onIconPressed;

  const ProfileAppBar({
    super.key,
    this.icon = Icons.arrow_back,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset(Assets.icons.avatar), 
          onPressed: onIconPressed,
        ),
        SizedBox(width: AppPadding.sidePaddingValue,)
      ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}