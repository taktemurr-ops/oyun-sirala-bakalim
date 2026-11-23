import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sirala_bakalim/oyun_sirala_bakalim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(siralaBakalimConfig.title.length, 33);
    expect(siralaBakalimConfig.tagline.length, 33);
    for (final s in siralaBakalimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(siralaBakalimConfig.gameId, siralaBakalimId);
    expect(siralaBakalimRules.gameId, siralaBakalimId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(siralaBakalimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: siralaBakalimId, optionalMechanics: siralaBakalimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(siralaBakalimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
