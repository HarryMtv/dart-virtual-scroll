import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:dart_virtual_scroll/src/models/data_source.dart';
import 'package:dart_virtual_scroll/src/models/item.dart';
import 'package:dart_virtual_scroll/src/models/workflow.dart';

@Component(
    selector: 'ui-scroll',
    templateUrl: 'ui_scroll.html',
    changeDetection: ChangeDetectionStrategy.OnPush,
    preserveWhitespace: false,
    directives: [
      NgFor,
      NgTemplateOutlet,

    ]
)
class UiScrollComponent implements OnInit, OnDestroy {

  StreamSubscription<Event> _scroll;

  @Input()
  TemplateRef template;

  @Input()
  DataSource dataSource;

  @Input()
  HtmlElement scrollParent;

  List<Item> items;

  @override
  void ngOnInit() {
   print('I am alive ${dataSource.data.length}');
   items = [];
   
   for(int i = 0; i < dataSource.data.length - 1; i++) {

     if(i < 10) {
       final tmp = Item(i, dataSource.data.elementAt(i), false);
       tmp.invisible = false;
       items.add(tmp);
     } else {
       items.add(Item(i, dataSource.data.elementAt(i), false));
     }

   }

   _scroll = scrollParent.onScroll.listen((event) => print(scrollParent.scrollTop));
  }

  @override
  void ngOnDestroy() {
    _scroll.cancel();
  }
}
