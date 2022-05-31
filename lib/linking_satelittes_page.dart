import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class LinkingSatellitesPage extends StatefulWidget {
  const LinkingSatellitesPage({Key? key}) : super(key: key);

  @override
  State<LinkingSatellitesPage> createState() => _LinkingSatellitesPageState();
}

class _LinkingSatellitesPageState extends State<LinkingSatellitesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              ULoadingIndicator(
                padding: EdgeInsets.zero,
              ),
              UText(
                UAppStrings.linkingSatellitesPage_title,
                textStyle: UTextStyle.H1_primaryHeader,
              ),
              SizedBox.square(
                dimension: 20,
              ),
              UText(
                UAppStrings.linkingSatellitesPage_subTitle,
                textStyle: UTextStyle.B1_body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
