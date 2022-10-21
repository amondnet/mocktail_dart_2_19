import 'package:mocktail_dart_2_19/mocktail_dart_2_19.dart';
// ------ Test ------ //

@visibleForTesting
mixin MockContextMixin implements Context {
  void _reportObserved(Observable atom) {}
}

class MockContext extends Mock with MockContextMixin implements Context {}

void main() {
  test('test', () {
    final context = MockContext();

    final observable = Observable(1, context)..value += 1;
    expect(observable.value, 2);
  });
}
