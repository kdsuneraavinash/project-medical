class StackManager {
  final List<dynamic> _stack;

  StackManager() : _stack = [];

  void storeObject(dynamic object) {
    _stack.add(object);
  }

  dynamic popObject() {
    return _stack.removeLast();
  }
}
