import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_import_account_page/models/suggested_seed_overlay.dart';

class SeedTextField extends StatefulWidget {
  const SeedTextField({
    Key? key,
    required this.addInSelectedGridView,
    required this.bip39Dic,
  }) : super(key: key);

  final List<String> bip39Dic;
  final Function(String passphrase) addInSelectedGridView;

  @override
  State<SeedTextField> createState() => _SeedTextFieldState();
}

class _SeedTextFieldState extends State<SeedTextField> {
  OverlayEntry? overlayEntry;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  List<String> suggestedPassphraseList = [];
  final layerLink = LayerLink();
  GlobalKey<SuggestedSeedsOverlayState> keySuggestedSeedsOverlay = GlobalKey();

  @override
  void initState() {
    super.initState();
    suggestedPassphraseList.addAll(widget.bip39Dic);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        //remove overlay
        overlayEntry?.remove();
        overlayEntry = null;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: UColors.foregroundDark,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          autofocus: true,
          focusNode: focusNode,
          autocorrect: false,
          controller: controller,
          cursorColor: Colors.white,
          style: UTextStyle.H5_fifthHeader.style
              .returnTextStyleType()
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Passphrase',
            hintStyle: UTextStyle.H5_fifthHeader.style
                .returnTextStyleType()
                .copyWith(color: UColors.textDark),
          ),
          textInputAction: TextInputAction.newline,
          onChanged: (word) {
            //update suggestedPassphraseList to update the suggestion memu
            searchPassphrass(controller.text.toLowerCase());
          },
          onSubmitted: (passphrase) {
            widget.addInSelectedGridView(passphrase);
            controller.clear();
            suggestedPassphraseList
              ..clear()
              ..addAll(widget.bip39Dic);
            focusNode.requestFocus();
            keySuggestedSeedsOverlay.currentState?.setState(() {});
          },
        ),
      ),
    );
  }

  void searchPassphrass(String query) {
    final _tempDicList = <String>[...widget.bip39Dic];

    if (query.isNotEmpty) {
      final _tempSuggestList = <String>[];
      //add any word start with [query] into _tempSuggestList
      for (final passPhrase in _tempDicList) {
        if (passPhrase.toLowerCase().startsWith(query)) {
          _tempSuggestList.add(passPhrase);
        }
      }

      //clear previous suggestedPassphraseList
      //update it with new suggestedPassphraseList
      setState(() {
        suggestedPassphraseList
          ..clear()
          ..addAll(_tempSuggestList);
      });
    } else {
      //when the text from the textfield is null
      //clear previous suggestedPassphraseList list
      //add all bip39 words
      setState(() {
        suggestedPassphraseList
          ..clear()
          ..addAll(_tempDicList);
      });
    }
  }

//显示overlay
  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderbox = context.findRenderObject()! as RenderBox;
    final size = renderbox.size;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height + 8),
          child: SuggestedSeedsOverlay(
            key: keySuggestedSeedsOverlay,
            suggestedPassphraseList: suggestedPassphraseList,
            onTap: widget.addInSelectedGridView,
          ),
        ),
      ),
    );
    overlay?.insert(overlayEntry!);
  }
}
