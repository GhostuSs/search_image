import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/project_settings/typography/app_typography.dart';

class BaseButton extends StatelessWidget{
  
  final String label;
  final Function() onPressed;
  
  BaseButton({required this.label,required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: height*0.0008),
      decoration: BoxDecoration(
        color: ProjectColors.blue,
        borderRadius: BorderRadius.circular(16)
      ),
      child: TextButton(
        child: Text(
          label,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: height*0.021,
              color: ProjectColors.white
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

}