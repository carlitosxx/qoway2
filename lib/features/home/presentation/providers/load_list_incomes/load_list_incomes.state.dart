import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/transaction.entity.dart';
part 'load_list_incomes.state.freezed.dart';

@freezed
abstract class LoadListIncomesState with _$LoadListIncomesState {
  /// Data is present state
  const factory LoadListIncomesState.data(
      {required List<Transaction> listTransactions}) = _Data;

  /// Initial/default state
  const factory LoadListIncomesState.initial() = _Initial;

  /// Data is loading state
  const factory LoadListIncomesState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadListIncomesState.error(ErrorMapping error) = _Error;
}
