import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/core/api/abstract_api_response.dart';
import 'package:uc_flutter_task/core/api/api_client.dart';
import 'package:uc_flutter_task/core/api/endpoints.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/channels/domain/services/interfaces/channels_service_interface.dart';

final channelServiceProvider =
    Provider<ChannelsServiceInterface>((ref) => ChannelsService(ref));

class ChannelsService implements ChannelsServiceInterface {
  Ref ref;
  ChannelsService(this.ref);
  @override
  Future<AbstractApiResponse> getPackages(RequestParams<String?> params) async {
    final buildUrl = Endpoints.getPackages(
        params['operatorUid']!, params['userId']!, params['deviceClass']!);
    final response = await ref.read(apiClientProvider).get(buildUrl);
    return ResponseHelper.handleResponse(response);
  }

  @override
  Future<AbstractApiResponse> getChannels(RequestParams<dynamic> params) async {
    String encodedString =
        params['packagesIds']!.map((number) => number.toString()).join('%2C');
    final buildUrl =
        Endpoints.getChannels(params['operatorUid']!, encodedString);
    final response = await ref.read(apiClientProvider).get(buildUrl);
    return ResponseHelper.handleResponse(response);
  }
}
