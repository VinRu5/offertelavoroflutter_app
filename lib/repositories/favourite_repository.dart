import 'package:offertelavoroflutter_app/models/favourite_job.dart';
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

  void setFavourites(List<FavouriteJob> favouritesList) =>
      favourites = favouritesList;
}
