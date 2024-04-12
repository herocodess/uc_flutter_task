import 'package:uc_flutter_task/core/api/abstract_api_response.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';

abstract interface class LoginServiceInterface {
  Future<AbstractApiResponse> login(RequestParams<String> data);
}
