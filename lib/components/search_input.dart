import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/services/api_service.dart';

class SearchInputField extends ConsumerWidget {
  final TextEditingController controller;
  final Function submitSearch;

  const SearchInputField(
      {Key key, @required this.controller, @required this.submitSearch})
      : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    FocusNode focusNode = FocusNode();
    final prodBool = watch(prodURLBool);

    // final cityProvider = watch(cityToSearchProvider);
    // controller.text = cityProvider.state;
    // String lastSearch = controller.text;

    return Row(
      children: [
        Expanded(
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              keyboardType: TextInputType.text,
              focusNode: focusNode,
              onChanged: (value) {
                RegExp charsOnly = RegExp("^[a-zA-Z\s]*");
                if (!charsOnly.hasMatch(value)) return "type letters only";
                return null;
              },
              onSubmitted: (val) => submitSearch(),
              decoration: InputDecoration(
                hintText: 'enter atleast 3 characters to search',
                labelText: 'Type a name of a city',
              ),
            ),
            itemBuilder: (_, cityName) {
              return ListTile(
                title: Text(cityName),
              );
            },
            onSuggestionSelected: (choosenCity) {
              controller.text = choosenCity;
            },
            suggestionsCallback: (String pattern) async {
              if (pattern.length >= 3) {
                return await ApiService.getCitiesAutoComplete(
                  useProd: prodBool.state,
                  query: pattern,
                );
              }
              return null;
            },
            validator: (value) {
              if (value.length < 3) {
                return "please enter at least 3 characters";
              }
              RegExp charsOnly = RegExp("^[a-zA-Z\s]*");
              if (!charsOnly.hasMatch(value)) return "type letters only";
              return null;
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            submitSearch();
            focusNode.unfocus();
          },
        ),
      ],
    );
  }
}
