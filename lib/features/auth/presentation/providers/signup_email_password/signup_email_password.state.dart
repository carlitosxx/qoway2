import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../utils/error_mapping.util.dart';
import '../../../domain/entities/user.entity.dart';
part 'signup_email_password.state.freezed.dart';

@freezed
abstract class SignupEmailPasswordState with _$SignupEmailPasswordState {
  /// Data is present state
  const factory SignupEmailPasswordState.data({required User user}) = _Data;

  /// Initial/default state
  const factory SignupEmailPasswordState.initial() = _Initial;

  /// Data is loading state
  const factory SignupEmailPasswordState.loading() = _Loading;

  /// Error when loading data state
  const factory SignupEmailPasswordState.error(ErrorMapping error) = _Error;
}
