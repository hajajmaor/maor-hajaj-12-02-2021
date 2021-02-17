import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/model/city_name_code_model.dart';

// ignore: must_be_immutable
class FavoriteButton extends StatefulWidget {
  String cityName;
  FavoriteButton(String cityName) {
    this.cityName = cityName.trim();
  }

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final Box<CityNameCodeModel> favoriteBox = Hive.box('favorites');

  Future<void> removeFromBox() async {
    await favoriteBox.delete(widget.cityName);
    setState(() {});
  }

  Future<void> addToFavoriteBox() async {
    final temp = Hive.box<CityNameCodeModel>('historyCityCodeName');

    var result = temp.get(widget.cityName.toLowerCase());
    // if (result == null) {
    //   result = temp.get(widget.cityName);
    // }
    await favoriteBox.put(
      widget.cityName.toLowerCase(),
      CityNameCodeModel.copy(result),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = favoriteBox.containsKey(widget.cityName.toLowerCase());

    return IconButton(
        tooltip: 'Add/Remove from favorite list',
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () {
          if (isFavorite)
            removeFromBox();
          else
            addToFavoriteBox();
        });
  }
}
