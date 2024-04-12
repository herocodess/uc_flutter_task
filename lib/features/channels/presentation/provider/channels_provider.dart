import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uc_flutter_task/core/exception/network_exceptions.dart';
import 'package:uc_flutter_task/core/utils/typedefs.dart';
import 'package:uc_flutter_task/features/channels/domain/repositories/channels_repository.dart';
import 'package:uc_flutter_task/features/channels/domain/repositories/interfaces/channels_repository_interface.dart';
import 'package:uc_flutter_task/features/channels/presentation/provider/channels_state.dart';

final channelsProvider =
    StateNotifierProvider<ChannelsProvider, ChannelsState>((ref) {
  final repository = ref.read(channelsRepositoryProvider);
  return ChannelsProvider(repository: repository);
});

class ChannelsProvider extends StateNotifier<ChannelsState> {
  final ChannelsRepositoryInterface repository;

  ChannelsProvider({required this.repository})
      : super(const ChannelsState.initial());

  void fetchPackages(RequestParams<String?> params) async {
    state = const FetchPackagesLoading();
    try {
      final result = await repository.fetchPackages(params);
      result.fold((l) => state = FetchPackagesError(l),
          (r) => state = FetchPackagesSuccess(r));
    } on DioException catch (e) {
      state = FetchPackagesError(NetworkExceptions.getDioException(e));
    }
  }

  void fetchChannels(RequestParams<dynamic> params) async {
    state = const FetchChannelsLoading();
    try {
      final result = await repository.fetchChannels(params);
      result.fold((l) => state = FetchChannelsError(l),
          (r) => state = FetchChannelsSuccess(r));
    } on DioException catch (e) {
      state = FetchChannelsError(NetworkExceptions.getDioException(e));
    }
  }
}
