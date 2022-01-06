import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_app/project_settings/colors/color_palette.dart';

class RawSegmented extends StatefulWidget {
  final int segmentedControlValue;
  final List<String> tabsNames;
  final void Function(int?) onValueChanged;
  const RawSegmented({Key? key, required this.segmentedControlValue, required this.onValueChanged, required this.tabsNames}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RawSegmented();
  }
}

class _RawSegmented extends State<RawSegmented> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: CupertinoSlidingSegmentedControl(
          groupValue: widget.segmentedControlValue,
          backgroundColor: ProjectColors.darkGray,
          thumbColor: ProjectColors.orange,
          children: <int, Widget>{
            for(int i=0;i<widget.tabsNames.length;i++) i: Tab(label: widget.tabsNames[i], index: i,isSelectedIndex: widget.segmentedControlValue),
            },
          onValueChanged: widget.onValueChanged
          ),
    );
  }
}

class Tab extends StatelessWidget {
  final String label;
  final int index;
  final int isSelectedIndex;
  const Tab({Key? key, required this.label, required this.index,required this.isSelectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: index!=isSelectedIndex ? ProjectColors.textLightGray : ProjectColors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ));
  }
}