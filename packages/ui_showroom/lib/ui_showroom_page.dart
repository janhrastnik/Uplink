library ui_showroom;

import 'package:flutter/material.dart';
import 'package:ui_showroom/ui_pages/ui_pages_export.dart';

class UIShowRoomPage extends StatelessWidget {
  const UIShowRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Library Show Room')),
      body: Center(
        child: Column(
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UIconPage(),
                  ),
                );
              },
              child: const Text('UIcon'),
            ),
            const _NavigateToUIExamplePages(
              uiPageTitle: 'UText',
              uiPage: UTextPage(),
            )
          ],
        ),
      ),
    );
  }
}

class _NavigateToUIExamplePages extends StatelessWidget {
  final String uiPageTitle;
  final Widget uiPage;

  const _NavigateToUIExamplePages({
    Key? key,
    required this.uiPageTitle,
    required this.uiPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox.square(
          dimension: 16,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => uiPage,
              ),
            );
          },
          child: Text(uiPageTitle),
        ),
      ],
    );
  }
}
