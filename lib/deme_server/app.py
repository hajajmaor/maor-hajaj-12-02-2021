from flask import Flask
from flask import Response

app = Flask(__name__)


@app.route('/forecasts/v1/daily/5day/<id>')  # ?<id>')
def five_day(id):
    return """
    {
    "Headline": {
        "EffectiveDate": "2021-02-16T13:00:00+02:00",
        "EffectiveEpochDate": 1613473200,
        "Severity": 3,
        "Text": "Thunderstorms in the area Tuesday afternoon through Tuesday evening",
        "Category": "thunderstorm",
        "EndDate": "2021-02-17T01:00:00+02:00",
        "EndEpochDate": 1613516400,
        "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/extended-weather-forecast/215854?unit=c&lang=en-us",
        "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?unit=c&lang=en-us"
    },
    "DailyForecasts": [
        {
            "Date": "2021-02-15T07:00:00+02:00",
            "EpochDate": 1613365200,
            "Temperature": {
                "Minimum": {
                    "Value": 9.7,
                    "Unit": "C",
                    "UnitType": 17
                },
                "Maximum": {
                    "Value": 20.2,
                    "Unit": "C",
                    "UnitType": 17
                }
            },
            "Day": {
                "Icon": 3,
                "IconPhrase": "Partly sunny",
                "HasPrecipitation": false
            },
            "Night": {
                "Icon": 36,
                "IconPhrase": "Intermittent clouds",
                "HasPrecipitation": false
            },
            "Sources": [
                "AccuWeather"
            ],
            "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=1&unit=c&lang=en-us",
            "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=1&unit=c&lang=en-us"
        },
        {
            "Date": "2021-02-16T07:00:00+02:00",
            "EpochDate": 1613451600,
            "Temperature": {
                "Minimum": {
                    "Value": 7,
                    "Unit": "C",
                    "UnitType": 17
                },
                "Maximum": {
                    "Value": 19.5,
                    "Unit": "C",
                    "UnitType": 17
                }
            },
            "Day": {
                "Icon": 17,
                "IconPhrase": "Partly sunny w/ t-storms",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Moderate"
            },
            "Night": {
                "Icon": 15,
                "IconPhrase": "Thunderstorms",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Light"
            },
            "Sources": [
                "AccuWeather"
            ],
            "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=2&unit=c&lang=en-us",
            "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=2&unit=c&lang=en-us"
        },
        {
            "Date": "2021-02-17T07:00:00+02:00",
            "EpochDate": 1613538000,
            "Temperature": {
                "Minimum": {
                    "Value": 8.1,
                    "Unit": "C",
                    "UnitType": 17
                },
                "Maximum": {
                    "Value": 11.9,
                    "Unit": "C",
                    "UnitType": 17
                }
            },
            "Day": {
                "Icon": 18,
                "IconPhrase": "Rain",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Light"
            },
            "Night": {
                "Icon": 12,
                "IconPhrase": "Showers",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Heavy"
            },
            "Sources": [
                "AccuWeather"
            ],
            "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=3&unit=c&lang=en-us",
            "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=3&unit=c&lang=en-us"
        },
        {
            "Date": "2021-02-18T07:00:00+02:00",
            "EpochDate": 1613624400,
            "Temperature": {
                "Minimum": {
                    "Value": 9.8,
                    "Unit": "C",
                    "UnitType": 17
                },
                "Maximum": {
                    "Value": 14.1,
                    "Unit": "C",
                    "UnitType": 17
                }
            },
            "Day": {
                "Icon": 13,
                "IconPhrase": "Mostly cloudy w/ showers",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Light"
            },
            "Night": {
                "Icon": 12,
                "IconPhrase": "Showers",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Moderate"
            },
            "Sources": [
                "AccuWeather"
            ],
            "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=4&unit=c&lang=en-us",
            "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=4&unit=c&lang=en-us"
        },
        {
            "Date": "2021-02-19T07:00:00+02:00",
            "EpochDate": 1613710800,
            "Temperature": {
                "Minimum": {
                    "Value": 9.2,
                    "Unit": "C",
                    "UnitType": 17
                },
                "Maximum": {
                    "Value": 16.4,
                    "Unit": "C",
                    "UnitType": 17
                }
            },
            "Day": {
                "Icon": 12,
                "IconPhrase": "Showers",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Moderate"
            },
            "Night": {
                "Icon": 39,
                "IconPhrase": "Partly cloudy w/ showers",
                "HasPrecipitation": true,
                "PrecipitationType": "Rain",
                "PrecipitationIntensity": "Moderate"
            },
            "Sources": [
                "AccuWeather"
            ],
            "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=5&unit=c&lang=en-us",
            "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=5&unit=c&lang=en-us"
        }
    ]
}
    """


@app.route('/locations/v1/cities/search')  # ?<id>')
def search():
    return """[
     {
         "Version": 1,
         "Key": "215854",
         "Type": "City",
         "Rank": 31,
         "LocalizedName": "Tel Aviv",
         "EnglishName": "Tel Aviv",
         "PrimaryPostalCode": "",
         "Region": {
             "ID": "MEA",
             "LocalizedName": "Middle East",
             "EnglishName": "Middle East"
         },
         "Country": {
             "ID": "IL",
             "LocalizedName": "Israel",
             "EnglishName": "Israel"
         },
         "AdministrativeArea": {
             "ID": "TA",
             "LocalizedName": "Tel Aviv",
             "EnglishName": "Tel Aviv",
             "Level": 1,
             "LocalizedType": "District",
             "EnglishType": "District",
             "CountryID": "IL"
         },
         "TimeZone": {
             "Code": "IST",
             "Name": "Asia/Jerusalem",
             "GmtOffset": 2,
             "IsDaylightSaving": false,
             "NextOffsetChange": "2021-03-26T00:00:00Z"
         },
         "GeoPosition": {
             "Latitude": 32.045,
             "Longitude": 34.77,
             "Elevation": {
                 "Metric": {
                     "Value": 34,
                     "Unit": "m",
                     "UnitType": 5
                 },
                 "Imperial": {
                     "Value": 111,
                     "Unit": "ft",
                     "UnitType": 0
                 }
             }
         },
         "IsAlias": false,
         "SupplementalAdminAreas": [],
         "DataSets": [
             "AirQualityCurrentConditions",
             "AirQualityForecasts",
             "Alerts",
             "ForecastConfidence"
         ]
     }
 ]"""


@app.route('/locations/v1/cities/autocomplete')  # ?<id>')
def autocomplete():
    return """[
     {
         "Version": 1,
         "Key": "215854",
         "Type": "City",
         "Rank": 31,
         "LocalizedName": "Tel Aviv",
         "Country": {
             "ID": "IL",
             "LocalizedName": "Israel"
         },
         "AdministrativeArea": {
             "ID": "TA",
             "LocalizedName": "Tel Aviv"
         }
     },
     {
         "Version": 1,
         "Key": "3431644",
         "Type": "City",
         "Rank": 45,
         "LocalizedName": "Telanaipura",
         "Country": {
             "ID": "ID",
             "LocalizedName": "Indonesia"
         },
         "AdministrativeArea": {
             "ID": "JA",
             "LocalizedName": "Jambi"
         }
     },
     {
         "Version": 1,
         "Key": "300558",
         "Type": "City",
         "Rank": 45,
         "LocalizedName": "Telok Blangah New Town",
         "Country": {
             "ID": "SG",
             "LocalizedName": "Singapore"
         },
         "AdministrativeArea": {
             "ID": "05",
             "LocalizedName": "South West"
         }
     },
     {
         "Version": 1,
         "Key": "325876",
         "Type": "City",
         "Rank": 51,
         "LocalizedName": "Telford",
         "Country": {
             "ID": "GB",
             "LocalizedName": "United Kingdom"
         },
         "AdministrativeArea": {
             "ID": "TFW",
             "LocalizedName": "Telford and Wrekin"
         }
     },
     {
         "Version": 1,
         "Key": "169072",
         "Type": "City",
         "Rank": 51,
         "LocalizedName": "Telavi",
         "Country": {
             "ID": "GE",
             "LocalizedName": "Georgia"
         },
         "AdministrativeArea": {
             "ID": "KA",
             "LocalizedName": "Kakheti"
         }
     },
     {
         "Version": 1,
         "Key": "230611",
         "Type": "City",
         "Rank": 51,
         "LocalizedName": "Telsiai",
         "Country": {
             "ID": "LT",
             "LocalizedName": "Lithuania"
         },
         "AdministrativeArea": {
             "ID": "TE",
             "LocalizedName": "Telšiai"
         }
     },
     {
         "Version": 1,
         "Key": "2723742",
         "Type": "City",
         "Rank": 55,
         "LocalizedName": "Telégrafo",
         "Country": {
             "ID": "BR",
             "LocalizedName": "Brazil"
         },
         "AdministrativeArea": {
             "ID": "PA",
             "LocalizedName": "Pará"
         }
     },
     {
         "Version": 1,
         "Key": "186933",
         "Type": "City",
         "Rank": 55,
         "LocalizedName": "Tela",
         "Country": {
             "ID": "HN",
             "LocalizedName": "Honduras"
         },
         "AdministrativeArea": {
             "ID": "AT",
             "LocalizedName": "Atlántida"
         }
     },
     {
         "Version": 1,
         "Key": "3453754",
         "Type": "City",
         "Rank": 55,
         "LocalizedName": "Telaga Asih",
         "Country": {
             "ID": "ID",
             "LocalizedName": "Indonesia"
         },
         "AdministrativeArea": {
             "ID": "JB",
             "LocalizedName": "West Java"
         }
     },
     {
         "Version": 1,
         "Key": "3453755",
         "Type": "City",
         "Rank": 55,
         "LocalizedName": "Telagamurni",
         "Country": {
             "ID": "ID",
             "LocalizedName": "Indonesia"
         },
         "AdministrativeArea": {
             "ID": "JB",
             "LocalizedName": "West Java"
         }
     }
 ]"""


@app.route('/citykey_demo')
def method_name():
    return Response(
        """
   [{"Version":1,"Key":"325876","Type":"City","Rank":51,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"TF3 2","Region":{"ID":"EUR","LocalizedName":"Europe","EnglishName":"Europe"},"Country":{"ID":"GB","LocalizedName":"United Kingdom","EnglishName":"United Kingdom"},"AdministrativeArea":{"ID":"TFW","LocalizedName":"Telford and Wrekin","EnglishName":"Telford and Wrekin","Level":1,"LocalizedType":"Unitary Authority","EnglishType":"Unitary Authority","CountryID":"GB"},"TimeZone":{"Code":"GMT","Name":"Europe/London","GmtOffset":0.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-28T01:00:00Z"},"GeoPosition":{"Latitude":52.677,"Longitude":-2.436,"Elevation":{"Metric":{"Value":150.0,"Unit":"m","UnitType":5},"Imperial":{"Value":492.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":0,"LocalizedName":"England","EnglishName":"England"},{"Level":3,"LocalizedName":"The Nedge","EnglishName":"The Nedge"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"20758","Type":"City","Rank":85,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"","Region":{"ID":"OCN","LocalizedName":"Oceania","EnglishName":"Oceania"},"Country":{"ID":"AU","LocalizedName":"Australia","EnglishName":"Australia"},"AdministrativeArea":{"ID":"VIC","LocalizedName":"Victoria","EnglishName":"Victoria","Level":1,"LocalizedType":"State","EnglishType":"State","CountryID":"AU"},"TimeZone":{"Code":"AEDT","Name":"Australia/Melbourne","GmtOffset":11.0,"IsDaylightSaving":true,"NextOffsetChange":"2021-04-03T16:00:00Z"},"GeoPosition":{"Latitude":-36.112,"Longitude":145.977,"Elevation":{"Metric":{"Value":129.0,"Unit":"m","UnitType":5},"Imperial":{"Value":423.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Moira","EnglishName":"Moira"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"3392544","Type":"City","Rank":85,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"R0E","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"CA","LocalizedName":"Canada","EnglishName":"Canada"},"AdministrativeArea":{"ID":"MB","LocalizedName":"Manitoba","EnglishName":"Manitoba","Level":1,"LocalizedType":"Province","EnglishType":"Province","CountryID":"CA"},"TimeZone":{"Code":"CST","Name":"America/Winnipeg","GmtOffset":-6.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T08:00:00Z"},"GeoPosition":{"Latitude":49.842,"Longitude":-95.385,"Elevation":{"Metric":{"Value":340.0,"Unit":"m","UnitType":5},"Imperial":{"Value":1115.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"3392543","Type":"City","Rank":85,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"B0K","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"CA","LocalizedName":"Canada","EnglishName":"Canada"},"AdministrativeArea":{"ID":"NS","LocalizedName":"Nova Scotia","EnglishName":"Nova Scotia","Level":1,"LocalizedType":"Province","EnglishType":"Province","CountryID":"CA"},"TimeZone":{"Code":"AST","Name":"America/Halifax","GmtOffset":-4.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T06:00:00Z"},"GeoPosition":{"Latitude":45.573,"Longitude":-62.464,"Elevation":{"Metric":{"Value":89.0,"Unit":"m","UnitType":5},"Imperial":{"Value":291.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Pictou County","EnglishName":"Pictou County"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"2125794","Type":"City","Rank":85,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"18969","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"US","LocalizedName":"United States","EnglishName":"United States"},"AdministrativeArea":{"ID":"PA","LocalizedName":"Pennsylvania","EnglishName":"Pennsylvania","Level":1,"LocalizedType":"State","EnglishType":"State","CountryID":"US"},"TimeZone":{"Code":"EST","Name":"America/New_York","GmtOffset":-5.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T07:00:00Z"},"GeoPosition":{"Latitude":40.322,"Longitude":-75.328,"Elevation":{"Metric":{"Value":127.0,"Unit":"m","UnitType":5},"Imperial":{"Value":416.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Montgomery","EnglishName":"Montgomery"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","DailyAirQualityForecast","DailyPollenForecast","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"2125065","Type":"City","Rank":85,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"37690","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"US","LocalizedName":"United States","EnglishName":"United States"},"AdministrativeArea":{"ID":"TN","LocalizedName":"Tennessee","EnglishName":"Tennessee","Level":1,"LocalizedType":"State","EnglishType":"State","CountryID":"US"},"TimeZone":{"Code":"EST","Name":"America/New_York","GmtOffset":-5.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T07:00:00Z"},"GeoPosition":{"Latitude":36.249,"Longitude":-82.545,"Elevation":{"Metric":{"Value":505.0,"Unit":"m","UnitType":5},"Imperial":{"Value":1656.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Washington","EnglishName":"Washington"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","DailyAirQualityForecast","DailyPollenForecast","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"2117131","Type":"City","Rank":385,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"84087","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"US","LocalizedName":"United States","EnglishName":"United States"},"AdministrativeArea":{"ID":"UT","LocalizedName":"Utah","EnglishName":"Utah","Level":1,"LocalizedType":"State","EnglishType":"State","CountryID":"US"},"TimeZone":{"Code":"MST","Name":"America/Denver","GmtOffset":-7.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T09:00:00Z"},"GeoPosition":{"Latitude":40.898,"Longitude":-111.913,"Elevation":{"Metric":{"Value":1266.0,"Unit":"m","UnitType":5},"Imperial":{"Value":4155.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Davis","EnglishName":"Davis"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","DailyAirQualityForecast","DailyPollenForecast","ForecastConfidence","FutureRadar","MinuteCast","Radar"]},{"Version":1,"Key":"2253926","Type":"City","Rank":385,"LocalizedName":"Telford","EnglishName":"Telford","PrimaryPostalCode":"99122","Region":{"ID":"NAM","LocalizedName":"North America","EnglishName":"North America"},"Country":{"ID":"US","LocalizedName":"United States","EnglishName":"United States"},"AdministrativeArea":{"ID":"WA","LocalizedName":"Washington","EnglishName":"Washington","Level":1,"LocalizedType":"State","EnglishType":"State","CountryID":"US"},"TimeZone":{"Code":"PST","Name":"America/Los_Angeles","GmtOffset":-8.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-14T10:00:00Z"},"GeoPosition":{"Latitude":47.694,"Longitude":-118.407,"Elevation":{"Metric":{"Value":724.0,"Unit":"m","UnitType":5},"Imperial":{"Value":2374.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[{"Level":2,"LocalizedName":"Lincoln","EnglishName":"Lincoln"}],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","DailyAirQualityForecast","DailyPollenForecast","ForecastConfidence","FutureRadar","MinuteCast","Radar"]}]""", mimetype='text/json')


@app.route('/currentconditions/v1/<id>')
def current(id):
    return Response("""
   [
    {
        "LocalObservationDateTime": "2021-02-15T23:51:00+02:00",
        "EpochTime": 1613425860,
        "WeatherText": "Mostly cloudy",
        "WeatherIcon": 38,
        "HasPrecipitation": false,
        "PrecipitationType": null,
        "IsDayTime": false,
        "Temperature": {
            "Metric": {
                "Value": 14.2,
                "Unit": "C",
                "UnitType": 17
            },
            "Imperial": {
                "Value": 58,
                "Unit": "F",
                "UnitType": 18
            }
        },
        "MobileLink": "http://m.accuweather.com/en/il/tel-aviv/215854/current-weather/215854?lang=en-us",
        "Link": "http://www.accuweather.com/en/il/tel-aviv/215854/current-weather/215854?lang=en-us"
    }
]
   """, mimetype="text/json")


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
