import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';

import '../../../project_settings/images/icons.dart';

class RawTextField extends StatefulWidget{
  RawTextField({required this.textFieldController, required this.onChanged, this.hint, required this.onSearchPressed});
  TextEditingController textFieldController;
  final void Function() onSearchPressed;
  final void Function(String) onChanged;
  final String? hint;

  @override
  State<StatefulWidget> createState() {
    return _RawTextFieldState();
  }
}

class _RawTextFieldState extends State<RawTextField>{
  FocusNode _focus = new FocusNode();
  Color iconColor = ProjectColors.textLightGray;
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange(){
    setState(() {
      widget.textFieldController.text.isNotEmpty
      ? iconColor=ProjectColors.blue
          : iconColor=ProjectColors.textLightGray;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: ProjectColors.darkGray,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: TextField(
              focusNode: _focus,
              style: const TextStyle(
                fontFamily: 'JosefinSans-Regular'
              ),
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: widget.onSearchPressed,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: iconColor
                      ),
                      child: Image.asset(AppIcons.search,filterQuality: FilterQuality.high,),),
                  ),
                )
              ),
              cursorHeight: 25,
              cursorWidth: 0.5,
              cursorColor: ProjectColors.white,
              controller: widget.textFieldController,
              onChanged: widget.onChanged,

            ),
          ),
        ),
      ),
    );
  }

}