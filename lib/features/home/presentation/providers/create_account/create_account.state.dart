import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/account.entity.dart';
// import '../../../../core/utils/map_failure_to_string.util.dart';
part 'create_account.state.freezed.dart';

@freezed
abstract class CreateAccountState with _$CreateAccountState {
  /// Data is present state
  const factory CreateAccountState.data({required Account account}) = _Data;

  /// Initial/default state
  const factory CreateAccountState.initial() = _Initial;

  /// Data is loading state
  const factory CreateAccountState.loading() = _Loading;

  /// Error when loading data state
  const factory CreateAccountState.error(ErrorMapping error) = _Error;
}
