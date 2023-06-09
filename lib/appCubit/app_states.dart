abstract class AppStates{}
class AppInitState extends AppStates{}
class AppLoadingState extends AppStates{}
class AppSuccessState extends AppStates{}
class AppErrorState extends AppStates{
  String? error;
  AppErrorState(this.error);
}