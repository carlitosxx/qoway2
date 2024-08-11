import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/account.entity.dart';

part 'edit_account.state.freezed.dart';

@freezed
abstract class EditAccountState with _$EditAccountState {
  /// Data is present state
  const factory EditAccountState.data({required Account account}) = _Data;

  /// Initial/default state
  const factory EditAccountState.initial() = _Initial;

  /// Data is loading state
  const factory EditAccountState.loading() = _Loading;

  /// Error when loading data state
  const factory EditAccountState.error(ErrorMapping error) = _Error;
}
