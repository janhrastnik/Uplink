part of '../u_user_profile_cards_page.dart';

class _UnreadMessagesUserProfileCardSession extends StatelessWidget {
  const _UnreadMessagesUserProfileCardSession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox.square(
            dimension: 16,
          ),
          const UText(
            'Unread Messages User Profile Card',
            textStyle: UTextStyle.H4_fourthHeader,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.offline,
            uMessage: UMessage(
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
              arrivalMessageTime: DateTime(2022, 05, 10, 22, 30),
            ),
            unreadMessages: 0,
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelongerverylongveryverylong',
            status: Status.online,
            uMessage: UMessage(
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
              arrivalMessageTime: DateTime(2022, 05, 10, 09, 30),
            ),
            unreadMessages: 1,
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.online,
            uMessage: UMessage(
              message: 'Lorem ipsum dolor sit amet',
              arrivalMessageTime: DateTime(2022, 05, 10, 04, 20),
            ),
            unreadMessages: 10,
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.idle,
            uMessage: UMessage(
              message: 'Lorem ipsum dolor sit amet',
              arrivalMessageTime: DateTime(2022, 05, 10, 17, 30),
            ),
            unreadMessages: 100,
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.offline,
            uMessage: UMessage(
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
              arrivalMessageTime: DateTime(2022, 05, 10, 10, 30),
            ),
            unreadMessages: 1000,
          ),
        ],
      ),
    );
  }
}
