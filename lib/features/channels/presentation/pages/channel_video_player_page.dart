import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uc_flutter_task/core/navigation/navigation.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/constants.dart';
import 'package:uc_flutter_task/core/utils/helpers.dart';

class ChannelVideoPlayerPage extends StatefulHookWidget {
  const ChannelVideoPlayerPage({
    super.key,
    required this.channelName,
    required this.channelLogoId,
  });
  final String channelName;
  final int? channelLogoId;

  @override
  State<ChannelVideoPlayerPage> createState() => _ChannelVideoPlayerPageState();
}

class _ChannelVideoPlayerPageState extends State<ChannelVideoPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      Helpers.decodeUrlFromBase64(
        StringConstants.$base64EncodedString,
      ),
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: widget.channelName,
        imageUrl: StringConstants.getChannelLogoFromId(
          widget.channelLogoId ??
              int.parse(
                StringConstants.$defaultLogoId,
              ),
        ),
      ),
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
        minBufferMs: 50000,
        maxBufferMs: 13107200,
        bufferForPlaybackMs: 2500,
        bufferForPlaybackAfterRebufferMs: 5000,
      ),
    );

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    _betterPlayerController.setupDataSource(betterPlayerDataSource);
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => pop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 16,
          ),
        ),
        title: Text(widget.channelName),
      ),
      body: (kIsWeb || !(Platform.isAndroid || Platform.isIOS))
          ? Container(
              color: AppColors.whiteColor,
              child: const Center(
                child: Text('Video player not supported on platform'),
              ),
            )
          : AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _betterPlayerController,
              ),
            ),
    );
  }
}
