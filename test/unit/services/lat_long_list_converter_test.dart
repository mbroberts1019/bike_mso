import 'package:test/test.dart';
import 'package:bike_mso/services/lat_long_list_converter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  group('ListConverter', () {
    group('mapCoords', () {
      test('should return empty list if passed empty list', () {
        final listConverter = ListConverter([]);
        final returnedList = listConverter.mapCoords();

        expect(returnedList, isEmpty);
      });
      test('should crash if passed null', () {
        final listConverter = ListConverter(null);

        expect(listConverter.mapCoords, throwsNoSuchMethodError);
      });

      test('should convert <PointLatLng> to List<LatLng>', () {
        List<PointLatLng> polyDecodedList = [
          PointLatLng(34.0, 114.0),
          PointLatLng(32.0, 116.0)
        ];
        List<LatLng> convertedList = [LatLng(34.0, 114.0), LatLng(32.0, 116.0)];

        final listConverter = ListConverter(polyDecodedList);
        final returnedList = listConverter.mapCoords();

        expect(returnedList, convertedList);
      });
    });
  });
}
