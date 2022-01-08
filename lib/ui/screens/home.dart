import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';
import 'package:image_search_app/routes.dart';
import 'package:image_search_app/ui/components/uikit/appbar.dart';
import 'package:image_search_app/ui/components/uikit/settings_card.dart';
import 'package:image_search_app/ui/screens/gallery/preview_photo_screen.dart';
import 'package:provider/src/provider.dart';

import '../../data/model/data/subscribe.dart';

class HomePage extends StatefulWidget {
  late final CameraDescription camera;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var imageFile;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: const InnerAppBar(
        automaticalyImplyLeading: false,
        title: 'Search',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height*0.043,
          ),
          RawCard(
            iconUp: const RawIcon(
              icon: Icons.photo_outlined,
              backColor: Colors.green,
            ),
            textUp: 'Photo',
            onPressedUp: () async {
              final suffix = context.read<Subscribe>();
              await suffix.checkStatus();
              if((suffix.quantities<5&&suffix.status==false)||suffix.status==true){
                var picture =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                suffix.quantities++;
                setState(() {
                  imageFile = picture;
                });
                if (imageFile != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PreviewPhotoScreen(
                            image: File(imageFile.path),
                          )));
                }
              }else{
                Navigator.pushNamed(context, '/subscribe');
              }
            },
            iconDown: const RawIcon(
              icon: Icons.photo_camera_sharp,
              backColor: Colors.purple,
            ),
            textDown: 'Camera',
            onPressedDown: () async {
              final suffix = context.read<Subscribe>();
              await suffix.checkStatus();
              if((suffix.quantities<5&&suffix.status==false)||suffix.status==true){
                suffix.quantities++;
                var picture =
                await ImagePicker().pickImage(source: ImageSource.camera);

                setState(() {
                  imageFile = picture;
                });
                if (imageFile != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PreviewPhotoScreen(
                            image: File(imageFile.path),
                          )));
                }
              }else{
                Navigator.pushNamed(context, '/subscribe');
              }
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
            onPressedDown: () {
              Navigator.pushNamed(context, MainNavigationRoutes.historyWords);
            },
            onPressedUp: () async {
              final suffix = context.read<Subscribe>();
              await suffix.checkStatus();
              if((suffix.quantities<5&&suffix.status==false)||suffix.status==true){
                suffix.quantities++;
                Navigator.pushNamed(context, MainNavigationRoutes.searchUrl);
              }
              else{
                Navigator.pushNamed(context, '/subscribe');
              }
            },
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
            onPressedDown: () {
              Navigator.pushNamed(context, MainNavigationRoutes.settings);
            },
            onPressedUp: () async {
              final suffix = context.read<Subscribe>();
              await suffix.checkStatus();
              if((suffix.quantities<5&&suffix.status==false)||suffix.status==true) {
                Navigator.pushNamed(context, MainNavigationRoutes.searchWords);
                suffix.quantities++;
              } else {
                Navigator.pushNamed(context, '/subscribe');
              }

            },
          )
        ],
      ),
    );
  }
}

class RawIcon extends StatelessWidget {
  final IconData icon;
  final Color backColor;

  const RawIcon({Key? key, required this.icon, required this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(height*0.0032),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(4)),
      child: Icon(
        icon,
        size: height*0.04,
      ),
    );
  }
}
