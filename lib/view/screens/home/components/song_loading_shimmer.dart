import 'package:breathin/imports.dart';
import 'package:shimmer/shimmer.dart';

class SongLoadingShimmer extends StatelessWidget {
  const SongLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.sp,
      child: Shimmer.fromColors(
        baseColor: context.theme.dividerColor,
        highlightColor: context.theme.colorScheme.background,
        child: Container(
          width: 127.sp,
          decoration: BoxDecoration(
            borderRadius: borderRadiusSmall,
            color: context.theme.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
