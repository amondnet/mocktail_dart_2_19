import 'package:mocktail_dart_2_19/mocktail_dart_2_19.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

// ------ Test ------ //

@visibleForTesting
mixin MockContextMixin implements Context {
  void _reportObserved(Observable atom) {}
}

class MockContext extends Mock with MockContextMixin implements Context {}

void main() {
  test('no such method', () {
    final context = MockContext();

    final observable = Observable(1, context)..value += 1;
    expect(observable.value, 2);
  });
}
