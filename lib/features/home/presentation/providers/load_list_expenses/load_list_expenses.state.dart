import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/transaction.entity.dart';
part 'load_list_expenses.state.freezed.dart';

@freezed
abstract class LoadListExpensesState with _$LoadListExpensesState {
  /// Data is present state
  const factory LoadListExpensesState.data(
      {required List<Transaction> listTransactions}) = _Data;

  /// Initial/default state
  const factory LoadListExpensesState.initial() = _Initial;

  /// Data is loading state
  const factory LoadListExpensesState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadListExpensesState.error(ErrorMapping error) = _Error;
}
