import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/account.entity.dart';
// import '../../../../core/utils/map_failure_to_string.util.dart';
part 'load_list_accounts_by_userid.state.freezed.dart';

@freezed
abstract class LoadListAccountsByUserIdState
    with _$LoadListAccountsByUserIdState {
  /// Data is present state
  const factory LoadListAccountsByUserIdState.data(
      {required List<Account> accounts}) = _Data;

  /// Initial/default state
  const factory LoadListAccountsByUserIdState.initial() = _Initial;

  /// Data is loading state
  const factory LoadListAccountsByUserIdState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadListAccountsByUserIdState.error(ErrorMapping error) =
      _Error;
}
