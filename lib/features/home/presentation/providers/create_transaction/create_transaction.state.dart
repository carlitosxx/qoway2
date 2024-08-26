import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../../auth/domain/entities/transaction.entity.dart';
part 'create_transaction.state.freezed.dart';

@freezed
abstract class CreateTransactionState with _$CreateTransactionState {
  /// Data is present state
  const factory CreateTransactionState.data(
      {required Transaction transaction}) = _Data;

  /// Initial/default state
  const factory CreateTransactionState.initial() = _Initial;

  /// Data is loading state
  const factory CreateTransactionState.loading() = _Loading;

  /// Error when loading data state
  const factory CreateTransactionState.error(ErrorMapping error) = _Error;
}
