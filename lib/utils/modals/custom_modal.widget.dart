// import 'package:custom_widgets/custom_widgets.dart';
import 'package:custom_widgets/custom_widgets.dart';

import 'package:flutter/material.dart';

import '../error_mapping.util.dart';

///customModal
Future<void> customModal(
    BuildContext context, ErrorMapping message, String closeText) {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              children: [
                const VerticalSpacerLarge(),
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  radius: MediaQuery.of(context).size.width / 5,
                  child: CustomPaint(
                    size: const Size(
                      80,
                      80 * 1.0010655301012252,
                    ),
                    painter: message.painter,
                  ),
                ),
                const VerticalSpacerMedium(),
                TextH1(
                  text: message.titleError,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const VerticalSpacerSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextB1(
                    text: message.messageError,
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalSpacerMedium(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      elevation: 0,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      closeText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
