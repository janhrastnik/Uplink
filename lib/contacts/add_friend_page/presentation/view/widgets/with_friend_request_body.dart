import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/helpers/build_user_list_tile_long_press.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/models/user_notifier.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class WithFriendRequestBody extends StatelessWidget {
  const WithFriendRequestBody({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: user.username,
          status: user.status ?? Status.offline,
          statusMessage: user.statusMessage,
          imageAddress:
              user.profilePicture == null ? '' : user.profilePicture!.path,
          onLongPress: () {
            buildUserListTileLongPress(context, user);
          },
          trailing: const UIcon(
            UIcons.outgoing_requests,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: UAppStrings.withFriendRequestBody_undo,
            uIconData: UIcons.remove_friend,
            onPressed: () {
              UBottomSheetTwoButtons(
                context,
                firstButtonOnPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                secondButtonOnPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  // TODO(yijing): update undo friend request
                  context.read<UserNotifier>().undoFriendRequest();
                  await showDialog<void>(
                    context: context,
                    builder: (context) => UDialogSingleButtonCustomBody(
                      title: UAppStrings.withFriendRequestBody_requestRemoved,
                      body: RichText(
                        text: TextSpan(
                          text: UAppStrings.withFriendRequestBody_yourRequest,
                          style: UTextStyle.B1_body.style.returnTextStyleType(),
                          children: <TextSpan>[
                            TextSpan(
                              text: user.username,
                              style: UTextStyle.H4_fourthHeader.style
                                  .returnTextStyleType(),
                            ),
                            const TextSpan(
                              text: UAppStrings.withFriendRequestBody_removed,
                            ),
                          ],
                        ),
                      ),
                      buttonText: UAppStrings.okay,
                    ),
                  );
                },
                header: UAppStrings.withFriendRequestBody_unsend,
                firstButtonText: UAppStrings.cancelButton,
                secondButtonText: UAppStrings.remove,
                secondButtonColor: UColors.termRed,
              ).show();
            },
          ),
        )
      ],
    );
  }
}
