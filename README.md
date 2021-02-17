# weather_app

A Flutter project use to search, mark favorites and view 5-day weather forcast.

The project is using Accuweather api to serve the data.

## Screenshots

## Getting Started

Before even cloning the repo, please go to [Accuweather](https://www.accuweather.com/) website and sign up in order to get the api key.

In order to run the app, you must clone the repo and open in VSCode or Android Studio.

After getting the api key,create a file called `creds.dart` in `/lib` directory.

In `creds.dart` create a constant of type String called dApiKey with the value of your API key.

Now you can run it.

## Running locally

Inside `/lib/deme_server` there is a mini flask application with static data.

If you have python installed, just install the `requirments.txt` with pip/pip3 and run it.

If you want to run with Docker driver, build the image, and run with -p x:5000, some comments inside should help.

One last thing in order to run locally,
change the value in `/lib/services/api_service.dart:15` to the url of your flask server.
