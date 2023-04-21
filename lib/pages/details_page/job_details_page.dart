import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/rich_text_row.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/select_row.dart';
import 'package:offertelavoroflutter_app/pages/details_page/widgets/text_row.dart';
import 'package:offertelavoroflutter_app/repositories/url_launcher_repository.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter_app/widgets/error_popup_widget.dart';

@RoutePage()
class JobDetailsPage extends StatelessWidget {
  final Job job;

  const JobDetailsPage({
    required this.job,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () => context.router.pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: 24.0,
                ),
              ),
              expandedHeight: 120,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "${job.emoji} ${job.qualification}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
                  builder: (context, state) {
                    if (state is LoadedFavouriteJobState) {
                      final isFavourite = state.favouriteJob.any(
                        (favorite) => favorite.id == job.id,
                      );

                      return IconButton(
                        onPressed: () => isFavourite
                            ? context.read<FavouriteJobBloc>().removeFavourite(
                                  FavouriteJob.fromJob(job),
                                )
                            : context.read<FavouriteJobBloc>().addFavourite(
                                  FavouriteJob.fromJob(job),
                                ),
                        icon: FaIcon(
                          isFavourite
                              ? FontAwesomeIcons.solidBookmark
                              : FontAwesomeIcons.bookmark,
                          size: 24.0,
                        ),
                      );
                    }

                    return IconButton(
                      onPressed: () => state is NoFavouriteJobState
                          ? context.read<FavouriteJobBloc>().addFavourite(
                                FavouriteJob.fromJob(job),
                              )
                          : null,
                      icon: const FaIcon(
                        FontAwesomeIcons.bookmark,
                        size: 24.0,
                      ),
                    );
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextRow(
                      label: "Nome azienda",
                      text: job.company,
                    ),
                    TextRow(
                      label: "URL sito web",
                      text: job.website,
                    ),
                    TextRow(
                      label: "Qualifica",
                      text: job.qualification.isNotEmpty
                          ? job.qualification
                          : job.title,
                    ),
                    SelectRow(
                      label: "Seniority",
                      selectLabel: job.seniority.getString,
                      backgroundColor: job.seniority.color,
                      color: job.seniority.colorText,
                    ),
                    SelectRow(
                      label: "Team",
                      selectLabel: job.team.getString,
                      backgroundColor: job.team.color,
                      color: job.team.colorText,
                    ),
                    SelectRow(
                      label: "Contratto",
                      selectLabel: job.contract.getString,
                      backgroundColor: job.contract.color,
                      color: job.contract.colorText,
                    ),
                    TextRow(
                      label: "RAL",
                      text: job.ral,
                    ),
                    RichTextRow(
                      label: "Descrizione offerta",
                      texts: job.description,
                    ),
                    TextRow(
                      label: "Come candidarsi",
                      text: job.toApply,
                      underline: true,
                      onPressed: () async {
                        try {
                          await context
                              .read<UrlLauncherRepository>()
                              .launchMyUrl(job.toApply);
                        } catch (e) {
                          _showErrorModal(
                            context,
                            e is ErrorLauncher
                                ? e.text ?? ''
                                : 'C\'è stato un errore',
                          );
                        }
                      },
                    ),
                    TextRow(
                      label: "Job Posted",
                      text: DateFormat("dd/MM/y  H:m").format(job.jobPosted),
                    ),
                    TextRow(
                      label: "Località",
                      text: job.location,
                    ),
                    TextRow(
                      label: "Stato di pubblicazione",
                      text: job.publicationStatus,
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  void _showErrorModal(
    BuildContext context,
    String errorMessage,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: true,
      barrierColor: AppColors.transparent,
      builder: (BuildContext context) => ErrorPopupWidget(
        title: "⚠️\nErrore",
        subtitle: errorMessage,
      ),
    );
  }
}
