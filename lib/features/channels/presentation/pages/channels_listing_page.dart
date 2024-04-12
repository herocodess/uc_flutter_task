import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uc_flutter_task/core/navigation/navigation.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/constants.dart';
import 'package:uc_flutter_task/core/utils/extensions.dart';
import 'package:uc_flutter_task/core/utils/helpers.dart';
import 'package:uc_flutter_task/core/utils/skeleton_loader.dart';
import 'package:uc_flutter_task/features/channels/data/channels_model.dart';
import 'package:uc_flutter_task/features/channels/presentation/pages/channel_video_player_page.dart';
import 'package:uc_flutter_task/features/channels/presentation/provider/channels_provider.dart';
import 'package:uc_flutter_task/features/channels/presentation/provider/channels_state.dart';
import 'package:uc_flutter_task/features/channels/presentation/widgets/channel_item_widget.dart';
import 'package:uc_flutter_task/widgets/custom_buttons.dart';
import 'package:uc_flutter_task/widgets/custom_cross_fade.dart';

class ChannelListingPage extends HookConsumerWidget {
  const ChannelListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildRef = ref.read(channelsProvider.notifier);
    final isLoading = useState<bool>(false);
    final packageIds = useState<List<int>>([]);
    final operatorUid = useState<String?>('');
    final channelsList = useState<List<ChannelsModel>>([]);
    final packagesErrorText = useState<String?>('');
    final channelsErrorText = useState<String?>('');

    void callInitialActions() async {
      operatorUid.value = await Helpers.getValueFromStorageBasedOnKey(ref,
          key: StringConstants.$operatorUid);
      final userId = await Helpers.getValueFromStorageBasedOnKey(ref,
          key: StringConstants.$userId);
      final data = {
        "operatorUid": operatorUid.value,
        "userId": userId,
        "deviceClass": "Mobile",
      };
      buildRef.fetchPackages(data);
    }

    useMemoized(() {
      callInitialActions();
    }, []);

    ref.listen(channelsProvider, (prev, next) {
      if (next is FetchPackagesLoading) {
        isLoading.value = true;
      }
      if (next is FetchPackagesSuccess) {
        for (var n in next.packages) {
          var id = n.id;
          if (!packageIds.value.contains(id)) {
            packageIds.value.add(id);
          }
        }

        final data = {
          "operatorUid": operatorUid.value,
          'packagesIds': packageIds.value,
        };
        buildRef.fetchChannels(data);
      }

      if (next is FetchPackagesError) {
        isLoading.value = false;
        packagesErrorText.value = next.error;
      }

      if (next is FetchChannelsLoading) {
        isLoading.value = true;
      }

      if (next is FetchChannelsSuccess) {
        isLoading.value = false;
        channelsList.value = next.channels;
      }

      if (next is FetchChannelsError) {
        isLoading.value = false;
        channelsErrorText.value = next.error;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Channels List'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CustomCrossFade(
          state: !isLoading.value,
          firstChild: Visibility(
            visible: channelsList.value.isNotEmpty,
            replacement: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Text(channelsErrorText.value ??
                      packagesErrorText.value ??
                      'An error occured'),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  PrimaryButton(
                      onTap: () {
                        callInitialActions();
                      },
                      buttonColor: AppColors.primaryColor,
                      text: 'Try again')
                ],
              ),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  channelsList.value.length,
                  (index) {
                    final channel = channelsList.value[index];
                    return ChannelItemWidget(
                      channel: channel,
                      onTap: () => pushTo(
                        context,
                        ChannelVideoPlayerPage(
                          channelName: channel.name ?? '',
                          channelLogoId: channel.logos.card,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          secondChild: CustomShimmerLoading.channelsListShimmer(),
        ),
      ),
    );
  }
}
