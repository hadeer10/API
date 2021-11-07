abstract class NewsStats {}
class InitialNewsStats extends NewsStats{}
class BottomNavNewsStats extends NewsStats{}

class NewsLoadingBusinesState extends NewsStats{}
class NewsGetBusinessSucessState extends NewsStats{}
class NewsGetBusinessErrorState extends NewsStats{
  String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsLoadingSportsState extends NewsStats{}
class NewsGetSportsSucessState extends NewsStats{}
class NewsGetSportsErrorState extends NewsStats{
  String error;

  NewsGetSportsErrorState(this.error);
}
class NewsLoadingScienceState extends NewsStats{}
class NewsGetScienceSucessState extends NewsStats{}
class NewsGetScienceErrorState extends NewsStats{
  String error;

  NewsGetScienceErrorState(this.error);
}