import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';

abstract class AppTypography{
  static const String _fontFamily='Montserrat';

  static const TextStyle semiBold18=TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    color: ProjectColors.white
  );

  static const TextStyle semiBold18Blue=TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      color: ProjectColors.systemBlue
  );

  static const TextStyle semiBold24=TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize:24.0,
      color: ProjectColors.white
  );

  static const TextStyle normal18gray=TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: ProjectColors.textDarkGray
  );
}