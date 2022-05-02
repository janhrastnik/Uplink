import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfile Status Indicator |', () {
    testWidgets(
        'Should return the right size value when the User Profile is large',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.large),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
      expect(_baseSize.width, equals(12.0));
      expect(_baseSize.height, equals(12.0));
    });

    testWidgets(
        'Should return the right size value when the User Profile is normal',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.normal),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
      expect(_baseSize.width, equals(12.0));
      expect(_baseSize.height, equals(12.0));
    });

    testWidgets(
        'Should return the right size value when the User Profile is top menu bar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.topMenuBar),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
      expect(_baseSize.width, equals(8.0));
      expect(_baseSize.height, equals(8.0));
    });
  });

  goldenTest(
    'Golden Test for Status Indicator |',
    fileName: 'status_indicator',
    builder: () => GoldenTestGroup(
      children: [
        GoldenTestScenario(
          name:
              'Should return the correct sizes and colors of Status Indicators',
          child: const SystemUnderTest(),
        ),
      ],
    ),
  );
}

class SystemUnderTest extends StatelessWidget {
  const SystemUnderTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UText('When User Profile has Large Size',
            textStyle: UTextStyle.H5_topMenuBarTitle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.large),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.idle,
                userProfileSize: UUserProfileSize.large),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.offline,
                userProfileSize: UUserProfileSize.large),
          ],
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        const UText('When User Profile has Normal Size',
            textStyle: UTextStyle.H5_topMenuBarTitle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.normal),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.idle,
                userProfileSize: UUserProfileSize.normal),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.offline,
                userProfileSize: UUserProfileSize.normal),
          ],
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        const UText('When User Profile has Top Menu Bar Size',
            textStyle: UTextStyle.H5_topMenuBarTitle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusIndicator(Status.online,
                userProfileSize: UUserProfileSize.topMenuBar),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.idle,
                userProfileSize: UUserProfileSize.topMenuBar),
            const SizedBox.square(
              dimension: 8,
            ),
            StatusIndicator(Status.offline,
                userProfileSize: UUserProfileSize.topMenuBar),
          ],
        ),
      ],
    );
  }
}