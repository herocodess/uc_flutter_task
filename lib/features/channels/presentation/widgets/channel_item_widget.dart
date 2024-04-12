import 'package:flutter/material.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/helpers.dart';
import 'package:uc_flutter_task/features/channels/data/channels_model.dart';

class ChannelItemWidget extends StatelessWidget {
  const ChannelItemWidget({
    super.key,
    required this.channel,
    required this.onTap,
  });

  final ChannelsModel channel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Helpers.getChannelLogo(
                logoID: channel.logos.card, channelName: channel.name ?? ''),
            title: Text(
              channel.type ?? '',
            ),
            subtitle: Text(
              channel.name ?? '',
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.blackColor,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
