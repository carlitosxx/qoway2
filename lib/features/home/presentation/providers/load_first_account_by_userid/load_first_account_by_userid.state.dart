import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/account.entity.dart';

part 'load_first_account_by_userid.state.freezed.dart';

@freezed
abstract class LoadFirstAccountByUserIdState
    with _$LoadFirstAccountByUserIdState {
  /// Data is present state
  const factory LoadFirstAccountByUserIdState.data({required Account account}) =
      _Data;

  /// Initial/default state
  const factory LoadFirstAccountByUserIdState.initial() = _Initial;

  /// Data is loading state
  const factory LoadFirstAccountByUserIdState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadFirstAccountByUserIdState.error(ErrorMapping error) =
      _Error;
}
