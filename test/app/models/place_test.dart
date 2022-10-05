import 'package:flutter_test/flutter_test.dart';
import 'package:travel_ui/app/models/place.dart';

void main() {
  group('$Place', () {
    group('fromMap | toMap', () {
      final placeMap = <String, dynamic>{
        'title': 'title',
        'description': 'description',
        'image': 'image',
        'location': 'location',
        'price': 0,
      };
      test('fromMap should return $Place with correct values', () {
        final place = Place.fromMap(placeMap);
        expect(place.title, 'title');
        expect(place.description, 'description');
        expect(place.image, 'image');
        expect(place.location, 'location');
        expect(place.price, 0);
      });
      test('toMap should return map with correct key and map', () {
        final place = Place.fromMap(placeMap);
        expect(place.toMap(), placeMap);
      });
      // Todo: Figure a work around for this
      test(
          'two different instances of $Place with the same values should return false if compared',
          () {
        final place1 = Place.fromMap(placeMap);
        final place2 = Place.fromMap(placeMap);
        expect(place1 == place2, false);
      });
    });
  });
}
