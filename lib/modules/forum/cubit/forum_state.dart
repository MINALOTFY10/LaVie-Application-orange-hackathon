part of 'forum_cubit.dart';

@immutable
abstract class ForumState {}

class ForumInitialState extends ForumState {}

class ForumLoadingState extends ForumState {}

class ForumSuccessState extends ForumState {}

class ForumErrorState extends ForumState {}

class ForumChangePageState extends ForumState {}

class ForumChangePhotoIndex extends ForumState {}

class ForumChangedPhotoBase64Success extends ForumState {}
