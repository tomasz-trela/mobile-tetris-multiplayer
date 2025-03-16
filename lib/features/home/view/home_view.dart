import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/common/widgets/app_bar/base_app_bar.dart';
import 'package:mobile_tetris_multiplayer/features/home/widgets/menu_selection_buttons.dart';
import 'package:mobile_tetris_multiplayer/gen/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        actions: [
          // IconButton(
          //   icon: SvgPicture.asset(Assets.icons.avatar), 
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: AppPadding.sideBasePadding,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            SvgPicture.asset(Assets.images.logo),
            SizedBox(height: 80,),
            MenuSelectionButtons()
          ],
        ),
      ),
    );
  }
}