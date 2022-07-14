// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class CTAButton extends StatelessWidget {
  const CTAButton({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    if (user.isBlocked == true) {
      return _TwoButtonsRow(disabled: true);
    } else if (user.relationship == Relationship.friend) {
      return UButton.primary(
        label: 'Message',
        uIconData: UIcons.message,
        onPressed: () {},
      );
    } else if (user.relationship == Relationship.none) {
      return _TwoButtonsRow(disabled: false);
    }
    return UButton.primary(
      label: 'Add Friend',
      uIconData: UIcons.add_contact_member,
      onPressed: () {
        // TODO(withpr): add button action
      },
    );
  }
}

class _TwoButtonsRow extends StatelessWidget {
  const _TwoButtonsRow({Key? key, required this.disabled}) : super(key: key);

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UButton.secondary(
            label: 'Message',
            uIconData: UIcons.message,
            onPressed: () {},
            disabled: disabled,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: UButton.primary(
            label: 'Add Friend',
            uIconData: UIcons.add_contact_member,
            onPressed: () {},
            disabled: disabled,
          ),
        )
      ],
    );
  }
}