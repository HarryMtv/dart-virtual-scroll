import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:dart_virtual_scroll/src/models/data_source.dart';
import 'package:dart_virtual_scroll/src/models/item.dart';

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
class UiScrollComponent implements OnInit, AfterViewInit, OnDestroy {

  num _startItem = 0;
  num _endItem = 1;
  num _itemHeight = 0;
  num _scrollHeight = 0;

  final List<Item> _items = [];
  StreamSubscription<Event> _scroll;
  final NgZone _zone;
  final ChangeDetectorRef _ref;

  int get _itemsLength => _items.length;

  UiScrollComponent(this._zone, this._ref);

  @Input()
  TemplateRef template;

  @Input()
  DataSource dataSource;

  @Input()
  HtmlElement scrollParent;

  @Input()
  HtmlElement scrollContainer;

  @ViewChildren('virtualItem', read: HtmlElement)
  List<HtmlElement> children;

  List<Item> get items => _getVirtualItems();

  @override
  void ngOnInit() {
   print('I am alive ${dataSource.data.length}');

   for(var i = 0; i < dataSource.data.length - 1; i++) {
     _items.add(Item(i, dataSource.data.elementAt(i), false));
   }

   _scroll = scrollParent.onScroll.listen(_calculateScroll);
  }

  @override
  void ngAfterViewInit() {
    print('Child count ${children?.length}');
    _itemHeight = max(children.first.clientHeight, children.first.offsetHeight);
    _itemHeight = max(_itemHeight, children.first.scrollHeight);
    _scrollHeight = _itemsLength * _itemHeight;
    scrollContainer.style
      ..height = '${_scrollHeight}px'
      ..top = '0'
      ..left = '0';
  }

  List<Item> _getVirtualItems() => _items.sublist(_startItem, _endItem);

  void _calculateScroll(Event event) {
    final itemsPerView = max(1, (scrollParent.clientHeight / _itemHeight).ceil());
    final topItemIndex = _itemsLength * scrollParent.scrollTop / _scrollHeight;
    final endItem = min(topItemIndex.ceil() + itemsPerView + 1, _itemsLength);
    final maxStart = max(0, _endItem - itemsPerView - 1);
    final startItem = min(maxStart, topItemIndex.floor());

    if(_startItem != startItem || _endItem != endItem) {
      _startItem = startItem;
      _endItem = endItem;

      final topPadding = _itemHeight * _startItem;
      scrollContainer.style.transform = 'translateY(${topPadding}px)';

      _ref.markForCheck();
      print(scrollParent.scrollTop);
      print('Start-$_startItem, Ent-$_endItem');
    }
  }

  @override
  void ngOnDestroy() {
    _scroll.cancel();
  }
}
