import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosBackBtn extends StatelessWidget{
  const IosBackBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 10,),
        Text(
          'Back',
          style: TextStyle(color: CupertinoColors.systemBlue,fontSize: 18),
        )
      ]),
    );
  }

}