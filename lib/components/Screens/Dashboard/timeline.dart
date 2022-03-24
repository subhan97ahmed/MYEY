import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:myey/components/BottomSheets/bottom_sheets.dart';
import 'package:myey/components/Constants/constants.dart';
import 'package:myey/components/Screens/Dashboard/dashboard.dart';
import 'package:myey/components/Screens/Scanning/ScanGuide.dart';
import 'package:myey/components/Values/values.dart';
import 'package:myey/components/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:myey/components/widgets/Dashboard/bottomNavigationItem.dart';
import 'package:myey/components/widgets/Dashboard/dashboard_add_icon.dart';
import 'package:myey/components/widgets/Dashboard/dashboard_add_sheet.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key, required this.selectedIndex}) : super(key: key);

  final ValueNotifier<int> selectedIndex;

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    bottomNavigatorTrigger = widget.selectedIndex;

    return Scaffold(
      backgroundColor: HexColor.fromHex("#181a1f"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        ValueListenableBuilder(
            valueListenable: bottomNavigatorTrigger,
            builder: (BuildContext context, _, __) {
              return PageStorage(
                  child: dashBoardScreens[bottomNavigatorTrigger.value],
                  bucket: bucket);
            })
      ]),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            BottomNavigationItem(
                itemIndex: 0,
                notifier: bottomNavigatorTrigger,
                icon: Icons.widgets),
            const Spacer(),
            const Spacer(),
            DashboardAddButton(
              iconTapped: (() {
                Get.to(() => const ScanGuide());
              }),
            ),
            const Spacer(),
            const Spacer(),
            BottomNavigationItem(
                itemIndex: 3,
                notifier: bottomNavigatorTrigger,
                icon: FeatherIcons.search),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
