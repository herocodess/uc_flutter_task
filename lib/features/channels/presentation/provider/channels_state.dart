// ignore_for_file: depend_on_referenced_packages

import 'package:uc_flutter_task/features/channels/data/channels_model.dart';
import 'package:uc_flutter_task/features/channels/data/packages_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'channels_state.freezed.dart';

@freezed
class ChannelsState with _$ChannelsState {
  const factory ChannelsState.initial() = ChannelsInitial;
  const factory ChannelsState.fetchPackagesloading() = FetchPackagesLoading;
  const factory ChannelsState.fetchPackagesSuccess(
      List<PackagesModel> packages) = FetchPackagesSuccess;
  const factory ChannelsState.fetchPackagesError(String error) =
      FetchPackagesError;
  const factory ChannelsState.fetchChannelsLoading() = FetchChannelsLoading;
  const factory ChannelsState.fetchChannelsSuccess(
      List<ChannelsModel> channels) = FetchChannelsSuccess;
  const factory ChannelsState.fetchChannelsError(String error) =
      FetchChannelsError;
}
