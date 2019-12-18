import 'dart:html';

import 'package:dart_virtual_scroll/src/models/settings.dart';
import 'package:dart_virtual_scroll/src/tools/dom_routines.dart';

class Viewport {
  Settings _settings;

  HtmlElement _host;
  HtmlElement _element;
  HtmlElement scrollEventElement;
  HtmlElement _scrollable;

  Viewport(HtmlElement element, Settings settings) {
    this._settings = settings;

    this._element = element;
    this._host = element.parent;
    this.scrollEventElement = this._host;
    this._scrollable = element.parent;
  }

  num getSize() => getElementSize(_host, _settings.isHorizontal);

  num get scrollPosition => getScrollPosition(this._scrollable, _settings.isHorizontal);
}
