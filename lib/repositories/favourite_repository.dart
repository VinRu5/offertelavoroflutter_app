import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

class FavouriteRepository {
  List<FavouriteJob> favourites = [];
  JobRepository jobRepository;

  FavouriteRepository(this.jobRepository);

  List<FavouriteJob> addFavourite(FavouriteJob job) {
    favourites.add(job);

    return favourites;
  }

  List<FavouriteJob> removeFavourite(FavouriteJob job) {
    favourites.removeWhere((favorite) => favorite.id == job.id);

    return favourites;
  }

  Future<List<FavouriteJob>> checkAvailable() async {
    try {
      final Iterable<String> jobs =
          (await jobRepository.firstListJobs).map((e) => e.id);
      final Iterable<String> freelance =
          (await jobRepository.firstListFreelance).map((e) => e.id);

      for (final job in favourites) {
        if (!jobs.contains(job.id) && !freelance.contains(job.id)) {
          job.isAvailable = false;
        }
      }

      return favourites;
    } catch (e) {
      rethrow;
    }
  }

  void setFavourites(List<FavouriteJob> favouritesList) =>
      favourites = favouritesList;
}
