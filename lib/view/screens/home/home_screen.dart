import 'package:breathin/controllers/songs_controller.dart';
import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/home/components/song_item_widget.dart';
import 'package:breathin/view/screens/home/components/song_loading_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SearchField(),
          14.verticalSpace,
          Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'favorites'.tr,
                  style: titleSmall(context).copyWith(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  'see_all'.tr,
                  style: titleSmall(context).copyWith(
                    color: context.theme.colorScheme.onBackground,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          GetBuilder<SongsController>(
            builder: (songsController) {
              final songs = songsController.songs;
              return SizedBox(
                height: 162.sp,
                width: double.infinity,
                child: ListView.separated(
                  padding: paddingHorizontal,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => songsController.isLoading
                      ? const SongLoadingShimmer()
                      : SongItemWidget(songModel: songs[index]),
                  separatorBuilder: (context, index) => 12.horizontalSpace,
                  itemCount: songsController.isLoading ? 4 : songs.length,
                ),
              );
            },
          ),
          14.verticalSpace,
          Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'featured'.tr,
                  style: titleSmall(context).copyWith(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  'see_all'.tr,
                  style: titleSmall(context).copyWith(
                    color: context.theme.colorScheme.onBackground,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          GetBuilder<SongsController>(
            builder: (songsController) {
              final songs = songsController.songs;
              return SizedBox(
                height: 162.sp,
                width: double.infinity,
                child: ListView.separated(
                  padding: paddingHorizontal,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => songsController.isLoading
                      ? const SongLoadingShimmer()
                      : SongItemWidget(songModel: songs[index]),
                  separatorBuilder: (context, index) => 12.horizontalSpace,
                  itemCount: songsController.isLoading ? 4 : songs.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
