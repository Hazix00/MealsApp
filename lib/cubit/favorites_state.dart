part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  final List<String> favoriteMeals;
  const FavoritesState({
    required this.favoriteMeals,
  });

  @override
  List<Object> get props => [favoriteMeals];

  FavoritesState copyWith({
    List<String>? favoriteMeals,
  }) {
    return FavoritesState(
      favoriteMeals: favoriteMeals ?? this.favoriteMeals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'favoriteMeals': favoriteMeals,
    };
  }

  factory FavoritesState.fromMap(Map<String, dynamic> map) {
    return FavoritesState(
      favoriteMeals: List<String>.from(map['favoriteMeals']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesState.fromJson(String source) =>
      FavoritesState.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
