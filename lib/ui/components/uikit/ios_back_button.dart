import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosBackBtn extends StatelessWidget{
  const IosBackBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Row(children: const [
        SizedBox(width: 5,),
        Icon(
          Icons.arrow_back_ios,
          color: CupertinoColors.systemBlue,
          size: 21,
        ),
        Text(
          'Back',
          style: TextStyle(
              color: CupertinoColors.systemBlue,
            fontSize: 18
          ),
        )
      ]),
    );
  }

}