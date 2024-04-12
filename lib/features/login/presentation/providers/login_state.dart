// ignore_for_file: depend_on_referenced_packages

import 'package:uc_flutter_task/core/api/abstract_api_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(AbstractApiResponse response) = LoginSuccess;
  const factory LoginState.error(String error) = LoginError;
}
