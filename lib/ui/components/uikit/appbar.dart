import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/project_settings/typography/app_typography.dart';

class InnerAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Widget? backBtn;
  final bool automaticalyImplyLeading;
  final List<Widget>? actions;

  const InnerAppBar({Key? key, required this.title, this.backBtn, required this.automaticalyImplyLeading, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leadingWidth: 90,
      centerTitle: true,
      backgroundColor: ProjectColors.darkGray,
      automaticallyImplyLeading: automaticalyImplyLeading,
      leading: automaticalyImplyLeading==false&&backBtn!=null ? backBtn : null,
      title: Text(
        title,
        style: AppTypography.semiBold18,
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);

}