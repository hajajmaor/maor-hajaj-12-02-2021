import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/components/deg_change_btn.dart';
import 'package:weather_app/components/main_drawer.dart';
import 'package:weather_app/components/theme_change_btn.dart';
import 'package:weather_app/pages/favorites.dart';
import 'package:weather_app/view/current_weather_view.dart';
import 'package:weather_app/view/forcast_for_five_days_view.dart';
import 'package:weather_app/components/search_input.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController(
    text: 'Tel Aviv',
  );
  @override
  Widget build(BuildContext context) {
    void submitSearch() {
      if (this._formKey.currentState.validate()) {
        this._formKey.currentState.save();
        setState(() {});
      }
    }

    // _logger.i('refrash= $refresh');
    return Scaffold(
      drawer: MainDrawer(),
      extendBody: true,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Favorite Page',
          icon: const Icon(Icons.star),
          onPressed: () async {
            // DONE-TODO: Navigate to favorites page
            String newCity = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FavoritePage(),
              ),
            );
            if (newCity != null) {
              setState(() {
                _controller.text = newCity;
              });
            }
          },
        ),
        actions: [
          const ChangeThemesIconButton(),
          const DegChangeButton(),
        ],
        title: const Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: this._formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SearchInputField(
                  controller: _controller,
                  submitSearch: submitSearch,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) => CurrentWeatherView(
                    cityName: _controller.text,
                    onPressed: () {
                      setState(() {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Updating..',
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: ForcastForFiveDaysView(
                cityName: _controller.text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
