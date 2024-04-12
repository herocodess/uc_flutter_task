import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uc_flutter_task/core/storage/shared_prefs.dart';
import 'package:uc_flutter_task/core/utils/colors.dart';
import 'package:uc_flutter_task/core/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Helpers {
  static Future<String?> getValueFromStorageBasedOnKey(dynamic ref,
      {required String key}) async {
    final storageRef = ref.read(sharedPrefProvider);
    if (await storageRef.read(key) == null ||
        await storageRef.read(key) == '') {
      return '';
    }
    return await storageRef.read(key);
  }

  static Widget getProgressLoader(
      {double? height, double? width, Color? color}) {
    return SizedBox(
      height: (height ?? 15),
      width: (width ?? 15),
      child: (kIsWeb || Platform.isAndroid)
          ? CircularProgressIndicator(
              strokeWidth: 1.5,
              color: color ?? AppColors.whiteColor,
            )
          : Transform.scale(
              scale: 0.5,
              child: CupertinoActivityIndicator(
                color: color ?? AppColors.whiteColor,
              ),
            ),
    );
  }

  static Widget getChannelLogo({
    required int? logoID,
    required String channelName,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: StringConstants.getChannelLogoFromId(
          logoID ??
              int.parse(
                StringConstants.$defaultLogoId,
              ),
        ),
        fit: BoxFit.cover,
        placeholder: (context, url) => CircleAvatar(
          backgroundColor: AppColors.blackColor,
          radius: 24,
          child: Center(
            child: Text(channelName[0]),
          ),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: AppColors.blackColor,
          radius: 24,
          child: Center(
            child: Text(channelName[0]),
          ),
        ),
      ),
    );
  }

  static String decodeUrlFromBase64(String base64String) {
    return utf8.decode(base64.decode(base64String));
  }
}
