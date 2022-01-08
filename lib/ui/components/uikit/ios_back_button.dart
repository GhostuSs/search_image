import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosBackBtn extends StatelessWidget{
  const IosBackBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Row(children: [
        SizedBox(width: height*0.0054),
        Icon(
          Icons.arrow_back_ios,
          color: CupertinoColors.systemBlue,
          size: height*0.022,
        ),
        Text(
          'Back',
          style: TextStyle(
              color: CupertinoColors.systemBlue,
            fontSize: height*0.02
          ),
        )
      ]),
    );
  }

}