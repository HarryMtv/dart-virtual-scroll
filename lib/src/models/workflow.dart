import 'dart:html';

import 'package:dart_virtual_scroll/src/models/scroller.dart';
import 'package:dart_virtual_scroll/src/tools/scroll.dart';
import 'package:dart_virtual_scroll/src/ui_scroll/ui_scroll.dart';

class Workflow {
  
  UiScrollComponent _context;
  Scroller _scroller;
  EventListener _onScrollHandler;

  Workflow(UiScrollComponent context) {
    this._context = context;
    this._scroller = Scroller(context);
    this._onScrollHandler = (event) => runScroll(this._scroller, event);
    this._scroller.viewport.scrollEventElement.addEventListener('scroll', print);
  }
}
