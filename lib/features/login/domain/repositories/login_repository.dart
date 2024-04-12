import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/core/api/abstract_api_response.dart';
import 'package:uc_flutter_task/core/storage/secure_storage.dart';
import 'package:uc_flutter_task/core/utils/constants.dart';
import 'package:uc_flutter_task/core/utils/enums.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/login/domain/repositories/interfaces/login_repository_interface.dart';
import 'package:uc_flutter_task/features/login/domain/services/interfaces/login_service_interface.dart';
import 'package:uc_flutter_task/features/login/domain/services/login_service.dart';

final loginRepositoryProvider = Provider<LoginRepositoryInterface>((ref) {
  final service = ref.read(loginServiceProvider);
  return LoginRepository(service: service, ref: ref);
});

class LoginRepository implements LoginRepositoryInterface {
  final LoginServiceInterface service;
  final Ref ref;
  LoginRepository({required this.service, required this.ref});
  @override
  ResponseFormat<AbstractApiResponse> login(RequestParams<String> data) async {
    final response = await service.login(data);
    if (response.status == ApiStatus.ok.name) {
      final result = response.data;
      final sProvider = ref.read(sharedPrefProvider);
      await sProvider.write(
          StringConstants.$accessToken, result['access_token']);
      await sProvider.write(
          StringConstants.$operatorUid, result['operator_uid']);
      await sProvider.write(
          StringConstants.$userId, result['user_id'].toString());
      return Right(response);
    } else {
      return Left(response.data['message']);
    }
  }
}
