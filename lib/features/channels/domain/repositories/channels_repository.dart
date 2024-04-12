import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/core/utils/enums.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/channels/data/channels_model.dart';
import 'package:uc_flutter_task/features/channels/data/packages_model.dart';
import 'package:uc_flutter_task/features/channels/domain/repositories/interfaces/channels_repository_interface.dart';
import 'package:uc_flutter_task/features/channels/domain/services/channels_service.dart';
import 'package:uc_flutter_task/features/channels/domain/services/interfaces/channels_service_interface.dart';

final channelsRepositoryProvider = Provider<ChannelsRepositoryInterface>((ref) {
  final service = ref.read(channelServiceProvider);
  return ChannelsRepository(service: service);
});

class ChannelsRepository implements ChannelsRepositoryInterface {
  final ChannelsServiceInterface service;
  ChannelsRepository({required this.service});
  @override
  ResponseFormat<List<ChannelsModel>> fetchChannels(
      RequestParams<dynamic> params) async {
    final response = await service.getChannels(params);
    if (response.status == ApiStatus.ok.name) {
      final channelsList = response.data
          .map<ChannelsModel>((x) => ChannelsModel.fromJson(x))
          .toList();
      return Right(channelsList);
    } else {
      return Left(response.data['message']);
    }
  }

  @override
  ResponseFormat<List<PackagesModel>> fetchPackages(
      RequestParams<String?> params) async {
    final response = await service.getPackages(params);
    if (response.status == ApiStatus.ok.name) {
      final packagesList = response.data
          .map<PackagesModel>((x) => PackagesModel.fromJson(x))
          .toList();
      return Right(packagesList);
    } else {
      return Left(response.data['message']);
    }
  }
}
