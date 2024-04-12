import 'package:uc_flutter_task/core/api/abstract_api_response.dart';
import 'package:uc_flutter_task/core/api/api_client.dart';
import 'package:uc_flutter_task/core/api/endpoints.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/features/login/domain/services/interfaces/login_service_interface.dart';

final loginServiceProvider = Provider<LoginServiceInterface>((ref) {
  return LoginService(ref);
});

class LoginService implements LoginServiceInterface {
  Ref ref;
  LoginService(this.ref);
  @override
  Future<AbstractApiResponse> login(RequestParams<String> data) async {
    final response = await ref
        .read(apiClientProvider)
        .postWithoutToken(Endpoints.login, data: data);
    return ResponseHelper.handleResponse(response);
  }
}
