import 'package:breathin/core/utils/extensions.dart';
import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/song/song_screen.dart';

class SongItemWidget extends StatelessWidget {
  const SongItemWidget({
    super.key,
    required this.songModel,
  });
  final SongModel songModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 127.sp,
      child: InkWell(
        onTap: () {
          launchScreen(SongScreen(songModel: songModel));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 127.sp,
                decoration: BoxDecoration(
                  color: context.theme.dividerColor,
                  borderRadius: borderRadiusSmall,
                  image: DecorationImage(
                    image: NetworkImage(songModel.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            6.verticalSpace,
            Text(
              songModel.name,
              style: titleSmall(context).copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            Row(
              children: [
                Text(
                  '${songModel.duration.secsToDuration} ${"mins".tr}',
                  style: bodySmall(context).copyWith(
                    color: context.theme.hintColor,
                  ),
                ),
                Text(
                  ' • ${songModel.type}',
                  style: bodySmall(context).copyWith(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
