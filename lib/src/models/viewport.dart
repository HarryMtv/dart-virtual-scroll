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
    _settings = settings;

    _element = element;
    _host = element.parent;
    scrollEventElement = _host;
    _scrollable = element.parent;
  }

  num getSize() => getElementSize(_host, _settings.isHorizontal);

  num get scrollPosition => getScrollPosition(_scrollable, _settings.isHorizontal);
}
