import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/project_settings/typography/app_typography.dart';

class BaseButton extends StatelessWidget{
  
  final String label;
  final Function() onPressed;
  
  BaseButton({required this.label,required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        color: ProjectColors.blue,
        borderRadius: BorderRadius.circular(16)
      ),
      child: TextButton(
        child: Text(
          label,
          style: AppTypography.semiBold18,
        ),
        onPressed: onPressed,
      ),
    );
  }

}