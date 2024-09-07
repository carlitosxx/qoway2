import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
// import '../../../../core/utils/map_failure_to_string.util.dart';
import '../../../domain/entities/user.entity.dart';
part 'load_session.state.freezed.dart';

@freezed
abstract class LoadSessionState with _$LoadSessionState {
  /// Data is present state
  const factory LoadSessionState.data({required User user}) = _Data;

  /// Initial/default state
  const factory LoadSessionState.initial() = _Initial;

  /// Data is loading state
  const factory LoadSessionState.loading() = _Loading;

  /// Error when loading data state
  const factory LoadSessionState.error(ErrorMapping error) = _Error;
}
