part of 'list_of_shops_bloc.dart';

@immutable
abstract class ListOfShopsState {}

class ListOfShopsInitial extends ListOfShopsState {}

class ListOfShopsLoading extends ListOfShopsState {}

class ListOfShopsLoaded extends ListOfShopsState {
  final List<ShopModel> shops;

  ListOfShopsLoaded(this.shops);
}

class ListOfShopsError extends ListOfShopsState {
  final String message;

  ListOfShopsError(this.message);
}
