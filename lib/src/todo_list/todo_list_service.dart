import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> _mockTodoList = <String>[];

  Future<List<String>> getTodoList() async => _getFilledList();

  List<String> _getFilledList() {
    for(int i = 1; i <= 1000; i++) {
      _mockTodoList.add(i.toString());
    }

    return _mockTodoList;
  }
}
