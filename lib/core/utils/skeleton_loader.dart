import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.backgroundColor,
  });
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final Color? baseColor, highlightColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.withOpacity(.1),
      highlightColor: highlightColor ?? Colors.white60,
      child: Container(
        height: height ?? 35,
        margin: const EdgeInsets.only(top: 8),
        width: width ?? 150,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.withOpacity(.7),
          borderRadius: borderRadius ?? BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CustomShimmerLoading {
  static Widget channelsListShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          3,
          (index) => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  child: CustomShimmer(),
                ),
                title: CustomShimmer(),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
