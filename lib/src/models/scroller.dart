import 'package:dart_virtual_scroll/src/models/settings.dart';
import 'package:dart_virtual_scroll/src/models/viewport.dart';
import 'package:dart_virtual_scroll/src/ui_scroll/ui_scroll.dart';

class Scroller {

  Viewport viewport;

  Scroller(UiScrollComponent context) {
    final Settings settings = Settings(false);
   // this.viewport = Viewport(context.nativeElement, settings);
  }
}
