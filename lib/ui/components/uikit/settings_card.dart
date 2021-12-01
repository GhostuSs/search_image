import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';

class RawCard extends StatelessWidget{

  final String textUp;
  final String textDown;
  final onPressedUp;
  final onPressedDown;
  final IconData iconUp;
  final IconData iconDown;

  const RawCard({this.onPressedUp, this.onPressedDown, required this.iconUp, required this.iconDown, required this.textUp, required this.textDown});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ProjectColors.darkGray
          ),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.only(topLeft: const Radius.circular(8.0),topRight: Radius.circular(8.0)),
                child: Card(
                  elevation: 0.0,
                  borderOnForeground: false,
                  color: ProjectColors.darkGray.withOpacity(0.8),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20,right: 15,top: 20,bottom: 20),
                          child: iconUp==Icons.share_rounded
                              ? Container(
                            padding: const EdgeInsets.all(1),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: ProjectColors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(
                                iconUp,
                                color: ProjectColors.white.withOpacity(0.8),
                                size: 22,
                              )],
                            ),
                          )
                              : Icon(
                            iconUp,
                            color: ProjectColors.white.withOpacity(0.9),
                            size: 24,
                          )
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
                          padding: const EdgeInsets.only(left: 20,right: 15,top: 20,bottom: 20),
                          child: iconDown==Icons.share_rounded
                              ? Container(
                            padding: const EdgeInsets.all(1),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: ProjectColors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(
                                iconDown,
                                color: Color(0xCC210741).withOpacity(0.8),
                                size: 22,
                              )],
                            ),
                          )
                              : Icon(
                            iconDown,
                            color: ProjectColors.white.withOpacity(0.9),
                            size: 24,
                          )
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