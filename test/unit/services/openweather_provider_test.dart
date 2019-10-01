import 'package:flutter_test/flutter_test.dart';
import 'package:bike_mso/services/openweather_provider.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'dart:convert';
import 'dart:async';

Future getData(http.Client client, url) async {
  http.Response responseData = await http.get(url);
  print(responseData);
  if (responseData.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return responseData.body;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

main() {
  group('getData', () {
    test('handles a request', () async {
      var client = MockClient((request) async => http.Response(
          json.encode(request.bodyFields), 200,
          request: request, headers: {'content-type': 'application/json'}));

      var response = await client.post('http://example.com/foo',
          body: {'field1': 'value1', 'field2': 'value2'});

      expect(
          response.body, json.encode({'field1': 'value1', 'field2': 'value2'}));
    });
  });
}

//"cod": "200",
//"message": 0.0061,
//"cnt": 40,
//"list": [
//{
//"dt": 1569380400,
//"main": {
//"temp": 49.87,
//"temp_min": 46.97,
//"temp_max": 49.87,
//"pressure": 1016.03,
//"sea_level": 1016.03,
//"grnd_level": 864.17,
//"humidity": 65,
//"temp_kf": 1.61
//},
//"weather": [
//{
//"id": 803,
//"main": "Clouds",
//"description": "broken clouds",
//"icon": "04n"
//}
//],
//"clouds": {
//"all": 68
//},
//"wind": {
//"speed": 4.5,
//"deg": 243.932
//},
//"sys": {
//"pod": "n"
//},
//"dt_txt": "2019-09-25 03:00:00"
//},
