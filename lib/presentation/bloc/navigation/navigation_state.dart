import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initialState() = NavigationInitialState;
}
