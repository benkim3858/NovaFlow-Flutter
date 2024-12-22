// providers/navigation_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class NavigationController extends _$NavigationController {
  @override
  int build() => 0; // 초기 인덱스 값

  void setIndex(int index) {
    state = index;
  }
}
