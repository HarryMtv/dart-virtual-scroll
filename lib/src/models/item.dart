import 'dart:html';

import 'package:dart_virtual_scroll/src/tools/dom_routines.dart';

class Item {

  num $index;
  Object data;
  String nodeId;

  HtmlElement element;
  num size;
  bool invisible;
  bool isHorizontal;

  Item(final num index, final Object data, final bool isHorizontal) {
    this.$index = index;
    this.data = data;
    this.nodeId = index.toString();
    this.invisible = true;
    this.isHorizontal = isHorizontal;
  }

  void setSize() {
    this.size = getElementSize(element, isHorizontal);
  }

  void hide() {
    if (this.element != null) {
      hideElement(this.element);
    }
  }
}
