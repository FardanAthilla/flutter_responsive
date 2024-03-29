import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/Device/Desktop.dart';
import 'package:responsive/Device/Phone.dart';
import 'package:responsive/Device/Tablet.dart';

class HomePage extends GetResponsiveView {
  HomePage({super.key})
      : super(
            settings: const ResponsiveScreenSettings(
          desktopChangePoint: 1000,
          tabletChangePoint: 640,
        ));

  @override
  Widget phone() {
    return HomePhone();
  }

  @override
  Widget tablet() {
    return HomeTablet();
  }

  @override
  Widget desktop() {
    return HomeDesktop();
  }
}
