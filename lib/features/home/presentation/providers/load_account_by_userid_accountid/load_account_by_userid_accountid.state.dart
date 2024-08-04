import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prinstom/features/auth/domain/entities/account.entity.dart';
import '../../../../../utils/error_mapping.util.dart';

part 'load_account_by_userid_accountid.state.freezed.dart';

@freezed
abstract class LoadAccountByUserIdAndAccountIdState
    with _$LoadAccountByUserIdAndAccountIdState {
  /// Data is present state
  const factory LoadAccountByUserIdAndAccountIdState.data(
      {required Account account}) = _Data;

  /// Initial/default state
  const factory LoadAccountByUserIdAndAccountIdState.initial() = _Initial;

  /// Data is loading state
  const factory LoadAccountByUserIdAndAccountIdState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadAccountByUserIdAndAccountIdState.error(ErrorMapping error) =
      _Error;
}
