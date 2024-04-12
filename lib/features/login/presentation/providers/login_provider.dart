import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/core/exception/network_exceptions.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/login/domain/repositories/interfaces/login_repository_interface.dart';
import 'package:uc_flutter_task/features/login/domain/repositories/login_repository.dart';
import 'package:uc_flutter_task/features/login/presentation/providers/login_state.dart';

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return LoginProvider(repository: repository);
});

class LoginProvider extends StateNotifier<LoginState> {
  final LoginRepositoryInterface repository;

  LoginProvider({required this.repository}) : super(const LoginState.initial());

  void login(RequestParams<String> data) async {
    state = const LoginState.loading();
    try {
      final result = await repository.login(data);
      result.fold((error) => state = LoginState.error(error),
          (response) => state = LoginState.success(response));
    } on DioException catch (e) {
      state = LoginState.error(NetworkExceptions.getDioException(e));
    }
  }
}
