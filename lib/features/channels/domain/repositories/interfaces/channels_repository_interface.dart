import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/channels/data/channels_model.dart';
import 'package:uc_flutter_task/features/channels/data/packages_model.dart';

abstract interface class ChannelsRepositoryInterface {
  ResponseFormat<List<PackagesModel>> fetchPackages(
      RequestParams<String?> params);
  ResponseFormat<List<ChannelsModel>> fetchChannels(
      RequestParams<dynamic> params);
}
