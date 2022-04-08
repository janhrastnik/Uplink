import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/widgets_export.dart';

void main() {
  group('UTextStyles |', () {
    const _textPoppinsFont = 'Poppins';
    const _textSpaceMonoFont = 'SpaceMono';

    test('Test quantity of TextStyles', () {
      const _listTextStyles = UTextStyle.values;
      expect(_listTextStyles.length, 12);
    });

    test('Test H1 Primary Header', () {
      final _textStyleUnderTest = UTextStyle.H1_primaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test H2 Secondary Header', () {
      final _textStyleUnderTest = UTextStyle.H2_secondaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 12.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });
    test('Test H2 Secondary Header', () {
      final _textStyleUnderTest = UTextStyle.H2_secondaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 12.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test H3 Tertiary Header', () {
      final _textStyleUnderTest = UTextStyle.H3_tertiaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 12.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test H4 Fourth Header', () {
      final _textStyleUnderTest = UTextStyle.H4_fourthHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 14.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w600);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test H5 Top Menu Bar Title', () {
      final _textStyleUnderTest = UTextStyle.H4_fourthHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 14.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w600);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test B1 Body', () {
      final _textStyleUnderTest = UTextStyle.B1_body.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test B2 Medium', () {
      final _textStyleUnderTest = UTextStyle.B2_medium.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w500);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test B3 Italics', () {
      final _textStyleUnderTest = UTextStyle.B3_italics.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.italic);
    });

    test('Test B4 Bold', () {
      final _textStyleUnderTest = UTextStyle.B4_bold.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test M1 Micro', () {
      final _textStyleUnderTest = UTextStyle.M1_micro.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 9.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test BUT1 Button', () {
      final _textStyleUnderTest = UTextStyle.BUT1_button.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });

    test('Test BUT2 Secondary Button', () {
      final _textStyleUnderTest = UTextStyle.BUT2_secondaryButton.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w500);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
    });
  });
}
