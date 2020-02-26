import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  final List<String> _mockTodoList = <String>[];

  Future<List<String>> getTodoList() async => _getFilledList();

  List<String> _getFilledList() {
    for(var i = 1; i <= 1000; i++) {
      _mockTodoList.add(i.toString());
    }

    return _mockTodoList;
  }
}
