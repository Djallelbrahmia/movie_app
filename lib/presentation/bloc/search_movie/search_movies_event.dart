abstract class SearchMoviesEvent {}

class FetchSearchMoviesEvent extends SearchMoviesEvent {
  final String query;
  FetchSearchMoviesEvent(this.query);
}
