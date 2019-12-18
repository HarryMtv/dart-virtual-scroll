import 'dart:html';

import 'package:angular/angular.dart';
import 'package:meta/meta.dart';
import 'package:dart_virtual_scroll/src/models/data_source.dart';
import 'package:dart_virtual_scroll/src/ui_scroll/ui_scroll.dart';
import 'package:dart_virtual_scroll/src/ui_scroll/ui_scroll_factory.dart';

@Directive(
    selector: '[uiScroll][uiScrollOf]'
)
class UiScrollDirective implements OnInit {
  
  final TemplateRef _templateRef;
  final ViewContainerRef _viewContainer;

  DataSource _dataSource;
  ComponentRef<Object> _componentRef;

  @Input()
  @required
  set uiScrollOf(DataSource dataSource) {
    this._dataSource = dataSource;
  }

  UiScrollDirective(
      this._templateRef,
      this._viewContainer,
      );

  @override
  void ngOnInit() {
    final compFactory = UiScrollFactory.instance;
    _componentRef =
        _viewContainer.createComponent(compFactory);

    _componentRef.instance as UiScrollComponent
      ..template = _templateRef
      ..dataSource = _dataSource
      ..scrollParent = querySelector('[ui-scroll-parent]');

    _componentRef.changeDetectorRef.markForCheck();
  }
}
