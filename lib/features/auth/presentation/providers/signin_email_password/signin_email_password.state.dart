import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../domain/entities/user.entity.dart';
part 'signin_email_password.state.freezed.dart';

@freezed
abstract class SigninEmailPasswordState with _$SigninEmailPasswordState {
  /// Data is present state
  const factory SigninEmailPasswordState.data({required User user}) = _Data;

  /// Initial/default state
  const factory SigninEmailPasswordState.initial() = _Initial;

  /// Data is loading state
  const factory SigninEmailPasswordState.loading() = _Loading;

  /// Error when loading data state
  const factory SigninEmailPasswordState.error(ErrorMapping error) = _Error;
}
