import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/routes.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'package:image_search_app/ui/components/uikit/settings_card.dart';


class HomePage extends StatefulWidget{
  late final CameraDescription camera;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: const InnerAppBar(automaticalyImplyLeading: false, title: 'Search',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          RawCard(
            iconUp: const RawIcon(
              icon: Icons.photo_outlined,
              backColor: Colors.green,
            ),
            textUp: 'Photo',
            onPressedUp: (){print('phot');},
            iconDown: const RawIcon(
              icon: Icons.photo_camera_sharp,
              backColor: Colors.purple,
            ),
            textDown: 'Camera',
            onPressedDown: () async {

              //Navigator.push(context,PageTransition(child: CameraScreen(camera:firstCamera), type: PageTransitionType.leftToRight));
              },

          ),
          RawCard(
            textDown: 'History',
            iconDown: const RawIcon(
              icon: Icons.turned_in,
              backColor: Colors.amber,
            ),
            iconUp: const RawIcon(
              icon: Icons.attach_file,
              backColor: Colors.red,
            ),
            textUp: 'Image URL',
            onPressedDown: (){debugPrint('History');},
            onPressedUp: (){Navigator.pushNamed(context, MainNavigationRoutes.searchUrl);},
          ),
          RawCard(
            textDown: 'Settings',
            iconDown: const RawIcon(
              icon: Icons.settings,
              backColor: Color(0xFF2B67D2),
            ),
            iconUp: const RawIcon(
              icon: Icons.add,
              backColor: Color(0xFF59A8D6),
            ),
            textUp: 'Search by words',
            onPressedDown: (){Navigator.pushNamed(context, MainNavigationRoutes.settings);},
            onPressedUp: (){debugPrint('SearchByWords');},
          )
        ],
      ),
    );
  }
}

class RawIcon extends StatelessWidget{
  
  final IconData icon;
  final Color backColor;

  const RawIcon({Key? key,required this.icon,required this.backColor}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: backColor,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Icon(
        icon,
        size: 29,
      ),
    );
  }
  
}