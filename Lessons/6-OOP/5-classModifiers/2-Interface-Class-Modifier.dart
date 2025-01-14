interface class TodoInterface {
  final String id;
  final String todo;
  late bool _isComplete;

  bool get isComplete => _isComplete;

  TodoInterface({
    required this.id,
    required this.todo,
    required isComplete,
  }) {
    this._isComplete = isComplete;
  }
}

class Todo extends TodoInterface {
  Todo({
    required super.id,
    required super.todo,
    required super.isComplete,
  });

  String checkTodo() => super.todo;
}

void main() {
  final todo01 = Todo(
    id: '1104',
    todo: 'Do the laundry.',
    isComplete: false,
  );

  final todoItem = todo01.checkTodo();

  final todo02 = TodoInterface(
    id: '1104',
    todo: 'Do the laundry.',
    isComplete: false,
  );

  print("Todo Item: $todoItem");

  print(todo02);
}


// interface class modifier

//  - interface classes

//    - can not be extended (inherited) outside of the module (library)

//    - can be constructed (impure interface)

//    - can be implemented


  // Impure interface

  //   - Can be constructed

  //   - Implies signatures do not have to be implemented if not defined