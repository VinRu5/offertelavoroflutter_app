import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/drawer_content.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class FavouriteList extends StatelessWidget {
  final List<FavouriteJob> favourites;
  final OnFavouriteCallback? onFavourite;
  final bool shrinkWrap;

  const FavouriteList({
    super.key,
    required this.favourites,
    this.shrinkWrap = false,
    this.onFavourite,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: shrinkWrap
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.zero,
        itemCount: favourites.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => Stack(
          children: [
            ListTile(
              onTap: () {
                context.router.pop();
                if (onFavourite != null) {
                  onFavourite!(favourites[index].id);
                }
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              dense: false,
              horizontalTitleGap: 0,
              title: Text(favourites[index].position),
              subtitle: Text(favourites[index].company),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(favourites[index].emoji),
                ],
              ),
              trailing: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: AppColors.red,
                ),
                onPressed: () => context
                    .read<FavouriteJobBloc>()
                    .removeFavourite(favourites[index]),
              ),
            ),
            Visibility(
              visible: !favourites[index].isAvailable,
              child: Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray.withAlpha(240),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Annuncio non più disponibile",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      GestureDetector(
                        onTap: () => context
                            .read<FavouriteJobBloc>()
                            .removeFavourite(favourites[index]),
                        child: Text(
                          "Elimina",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
