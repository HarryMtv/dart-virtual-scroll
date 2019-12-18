import 'dart:html';

import 'package:dart_virtual_scroll/src/models/scroller.dart';

void runScroll (Scroller scroller, Event eventListener) {
  final position = scroller.viewport.scrollPosition;
  final time = DateTime.now().millisecond;
  //final direction = Scroll.getDirection(scroller, position);
  //final data = ScrollEventData();
}
