import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';

class RawCard extends StatelessWidget{

  final String textUp;
  final String textDown;
  final onPressedUp;
  final onPressedDown;
  final Widget iconUp;
  final Widget iconDown;

  const RawCard({this.onPressedUp, this.onPressedDown, required this.iconUp, required this.iconDown, required this.textUp, required this.textDown});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30,left: 10,right: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ProjectColors.darkGray
          ),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.only(topLeft: const Radius.circular(8.0),topRight: const Radius.circular(8.0)),
                child: Card(
                  elevation: 0.0,
                  borderOnForeground: false,
                  color: ProjectColors.darkGray.withOpacity(0.8),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 10),
                          child: iconUp
                      ),
                      Text(
                          textUp,
                          style: TextStyle(
                              color: ProjectColors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                              fontFamily: 'JosefinSans-SemiBold'
                          )
                      ),
                      const Spacer(),
                      const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ProjectColors.textLightGray,
                          )
                      )
                    ],
                  ),
                ),
                onTap: onPressedUp,
              ),
              Container(width: double.infinity,height: 0.2,color: ProjectColors.textDarkGray,),
              InkWell(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  color: ProjectColors.darkGray.withOpacity(0.8),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 10),
                          child: iconDown,
                          ),
                      Text(
                          textDown,
                          style: TextStyle(
                              color: ProjectColors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                              fontFamily: 'JosefinSans-SemiBold'
                          )
                      ),
                      const Spacer(),
                      const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ProjectColors.textLightGray,
                          )
                      )
                    ],
                  ),
                ),
                onTap: onPressedDown,
              )
            ],
          ),
        )
    );
  }

}