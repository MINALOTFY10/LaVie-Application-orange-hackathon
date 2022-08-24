part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeBottomNavState extends HomeState {}

class ChangeNavState extends  HomeState{}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeChangePageState extends HomeState {}

//================================================================



