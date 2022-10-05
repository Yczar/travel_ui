import 'package:flutter_test/flutter_test.dart';
import 'package:travel_ui/app/models/onboarding.dart';

void main() {
  group('$Onboarding', () {
    group('fromMap | toMap', () {
      final onboardingMap = <String, dynamic>{
        'title': 'title',
        'description': 'description',
      };
      test('fromMap should return $Onboarding with correct values', () {
        final onboarding = Onboarding.fromMap(onboardingMap);
        expect(onboarding.title, 'title');
        expect(onboarding.description, 'description');
      });
      test('toMap should return map with correct key and map', () {
        final onboarding = Onboarding.fromMap(onboardingMap);
        expect(onboarding.toMap(), onboardingMap);
      });
      test(
          'two different instances of $Onboarding with the same values should return true if compared',
          () {
        final onboarding1 = Onboarding.fromMap(onboardingMap);
        final onboarding2 = Onboarding.fromMap(onboardingMap);
        expect(onboarding1 == onboarding2, true);
      });
    });
  });
}
