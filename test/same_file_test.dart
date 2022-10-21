import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class Observable<T> {
  Observable(this._value, this._context);

  T _value;
  final Context _context;

  set value(T value) {
    _value = value;
  }

  T get value {
    _context._reportObserved(this);
    return _value;
  }
}

class Context {
  void _reportObserved(Observable atom) {}
}

class MockContext extends Mock implements Context {}

void main() {
  test('same file', () {
    final context = MockContext();

    final observable = Observable(1, context)..value += 1;
    expect(observable.value, 2);
  });
}
