import 'package:cafe_buzzybee/src/core/common/widgets/responsive_widget.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/desktop/home_desktop_page.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/mobile/home_mobile_page.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/responsive/tablet/home_tablet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ResponsiveWidget(
      desktop: HomeDesktopPage(),
      tablet: HomeTabletPage(),
      mobile: HomeMobilePage(),
    );
  }
}
