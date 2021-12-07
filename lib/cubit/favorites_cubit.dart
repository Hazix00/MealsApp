import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> with HydratedMixin {
  FavoritesCubit() : super(FavoritesState(favoriteMeals: []));

  void addToFavorites(String mealId) {
    var favoriteMeals = List<String>.from(state.favoriteMeals);
    favoriteMeals.add(mealId);
    emit(FavoritesState(favoriteMeals: favoriteMeals));
  }

  void removeFromFavorites(String mealId) {
    var favoriteMeals = List<String>.from(state.favoriteMeals);
    favoriteMeals.remove(mealId);
    emit(FavoritesState(favoriteMeals: favoriteMeals));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    return FavoritesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    final str = state.toMap();
    return str;
  }
}
