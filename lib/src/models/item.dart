import 'dart:html';

import 'package:dart_virtual_scroll/src/tools/dom_routines.dart';

class Item {

  num $index;
  Object data;
  String nodeId;

  HtmlElement element;
  num size;
  bool isVisible;
  bool isHorizontal;

  Item(final num index, final Object data, final bool isHorizontal) {
    $index = index;
    this.data = data;
    nodeId = index.toString();
    isVisible = true;
    this.isHorizontal = isHorizontal;
  }

  void setSize() {
    size = getElementSize(element, isHorizontal);
  }

  void hide() {
    if (element != null) {
      hideElement(element);
    }
  }
}
