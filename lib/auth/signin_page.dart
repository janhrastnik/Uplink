import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/u_bottom_sheet_options.dart';
import 'package:uplink/pages_export.dart';
// import 'package:uplink/auth/auth_export.dart';
// import 'package:uplink/l10n/main_app_strings.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.iconOnly(
        leading: const SizedBox(),
        actionList: [
          IconButton(
            icon: const UIcon(UIcons.menu_bar_contacts),
            onPressed: () {
              UBottomSheetOptions(
                context,
                sheetTitle: 'More Options',
                titleList: ['Switch Account', 'New Account'],
                iconList: [UIcons.multiple_accounts, UIcons.add_contact_member],
                onTapList: [
                  () {
                    print(1);
                  },
                  () {
                    print(2);
                  },
                ],
              ).show();
            },
            splashRadius: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(flex: 9, child: Container()),
            const UText(
              'Enter Pin Code',
              textStyle: UTextStyle.H1_primaryHeader,
              textAlign: TextAlign.center,
            ),
            Flexible(child: Container()),
            const UText(
              'Enter your Pin to unlock your account.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            Flexible(flex: 3, child: Container()),
            Stack(
              children: [
                UPin(
                  key: UniqueKey(),
                  //TODO(yijing): Get user's pin code length and update the pinLength
                  pinLength: 4,
                  //TODO(yijing): update pin validation
                  rightButtonFn: (pin) {
                    //TODO(yijing) uncomment navigator
                    if (pin == '9999') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const ChatIndexPage(),
                        ),
                      );
                    }
                  },
                ),
                Align(
                  heightFactor: 6.5,
                  child: UTertiaryButton(
                    label: 'Forgot Your Pin Code',
                    onPressed: () {
                      //TODO(yijing): add forgot pin pages
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}