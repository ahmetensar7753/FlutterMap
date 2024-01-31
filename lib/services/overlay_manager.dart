import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:map_app/widgets/CustomInfoWidget.dart';

class OverlayManager {
  static OverlayEntry overlayEntry =
      OverlayEntry(builder: (context) => const SizedBox());

  static void showOverlay(
      BuildContext context, String data, Color color1, Color color2) {
    overlayEntry = OverlayEntry(builder: (context) => const SizedBox());
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: 160,
        right: 8,
        child: GestureDetector(
            onTap: () {
              try {
                overlayEntry.remove();
              } catch (e) {
                log('error -> $e');
              }
            },
            child: YourCustomWidget(
              color: color1,
              color2: color2,
              data: data,
            )),
      );
    });

    Overlay.of(context).insert(overlayEntry);
  }

  static void hideOverlay() {
    try {
      overlayEntry.remove();
    } catch (e) {
      log('error -> $e');
    }
  }
}
