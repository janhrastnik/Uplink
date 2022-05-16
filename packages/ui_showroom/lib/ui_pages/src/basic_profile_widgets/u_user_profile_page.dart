import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_unreads_chat_bubble/u_user_profile_unreads_chat_bubble.dart';

class UUserProfilePage extends StatelessWidget {
  const UUserProfilePage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: const [
            _UserProfileRow(
              title: 'User Profile Status 56x56',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.large,
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.large,
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.large,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 40x40',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.normal,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 36x36',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile 40x40',
              userProfile: [
                UUserProfile(),
                UUserProfile.withUsername(
                  username: 'username',
                ),
                UUserProfile.withUsername(
                  username: 'longusername',
                ),
                UUserProfile.withUsername(
                  username: 'longusernamebigger',
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Notification 40x40',
              userProfile: [
                UUserProfileNotification(),
                UUserProfileNotification.withUsername(
                  username: 'username',
                ),
                UUserProfileNotification.withUsername(
                  username: 'longusername',
                ),
                UUserProfileNotification.withUsername(
                  username: 'longusernamebigger',
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Unreads 40x40',
              userProfile: [
                UUserProfileUnreads(
                  unreadMessages: 2,
                ),
                UUserProfileUnreads.withUsername(
                  username: 'username',
                  unreadMessages: 89,
                ),
                UUserProfileUnreads.withUsername(
                  username: 'longusername',
                  unreadMessages: 100,
                ),
                UUserProfileUnreads.withUsername(
                  username: 'longusernamebigger',
                  unreadMessages: 99999,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Unreads Chat Bubble 56x56',
              userProfile: [
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 2,
                ),
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 89,
                ),
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 100,
                ),
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 99999,
                ),
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserProfileRow extends StatelessWidget {
  const _UserProfileRow(
      {Key? key, required this.title, required this.userProfile})
      : super(key: key);

  final String title;
  final List<Widget> userProfile;

  @override
  Widget build(BuildContext context) {
    List<Widget> _userProfiles = [];

    userProfile.forEach(((element) {
      _userProfiles.add(element);
      _userProfiles.add(const SizedBox.square(dimension: 8));
    }));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox.square(
          dimension: 16,
        ),
        UText(
          title,
          textStyle: UTextStyle.H1_primaryHeader,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _userProfiles,
        )
      ],
    );
  }
}