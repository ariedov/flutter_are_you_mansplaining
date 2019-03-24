import 'package:mansplaining/logic/action.dart';
import 'package:mansplaining/logic/exceptions.dart';
import 'package:mansplaining/logic/navigator.dart';
import 'package:mansplaining/logic/screens.dart';
import 'package:test_api/test_api.dart';

void main()
{
  var navigator = new NavigatorReducer();

  test('She asked to explain it', () {
    var result = navigator.navigate(DidSheAskToExplainThisScreen(), new Yes());
    expect(result, TypeMatcher<NotMansplainingScreen>());
  });

  test('She did not ask to explain it', () {
    var result = navigator.navigate(DidSheAskToExplainThisScreen(), new No());
    expect(result, TypeMatcher<YouHaveMoreExperienceScreen>());
  });

  test('You have more relevant experience', () {
    var result = navigator.navigate(YouHaveMoreExperienceScreen(), IHaveMoreExperience());
    expect(result, TypeMatcher<MostMenWithHerEducationWillKnowThisScreen>());
  });

  test('You have same experience', () {
    var result = navigator.navigate(YouHaveMoreExperienceScreen(), AboutTheSameExperience());
    expect(result, TypeMatcher<ProbablyMansplainingScreen>());
  });

  test('She has more experience', ()
  {
    var result = navigator.navigate(YouHaveMoreExperienceScreen(), SheHasMoreExperience());
    expect(result, TypeMatcher<DefinitelyMansplainingScreen>());
  });

  test('She is a well known expert', () {
    var result = navigator.navigate(YouHaveMoreExperienceScreen(), SheIsAnExpert());
    expect(result, TypeMatcher<StopNowScreen>());
  });

  test('Men with her experience will know this', () {
    var result = navigator.navigate(MostMenWithHerEducationWillKnowThisScreen(), Yes());
    expect(result, TypeMatcher<ProbablyMansplainingScreen>());
  });

  test('Men with her experience will not know this', () {
    var result = navigator.navigate(MostMenWithHerEducationWillKnowThisScreen(), No());
    expect(result, TypeMatcher<YouAskedIfSheNeedsExplanationScreen>());
  });

  test('You asked and she agreed to you for explanation', () {
    var result = navigator.navigate(YouAskedIfSheNeedsExplanationScreen(), SheAgreedToExplanation());
    expect(result, TypeMatcher<NotMansplainingScreen>());
  });

  test('She refused your explanation', () {
    var result = navigator.navigate(YouAskedIfSheNeedsExplanationScreen(), SheRefusedExplanation());
    expect(result, TypeMatcher<StopNowScreen>());
  });

  test('You did not ask to provide explanation', () {
    var result = navigator.navigate(YouAskedIfSheNeedsExplanationScreen(), IDidNotAskPermission());
    expect(result, TypeMatcher<ProbablyMansplainingScreen>());
  });

  test('Did she ask to explain error', () {
    var screen = DidSheAskToExplainThisScreen();

    expect(() => navigator.navigate(screen, IHaveMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, AboutTheSameExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheHasMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheIsAnExpert()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheAgreedToExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheRefusedExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, IDidNotAskPermission()), throwsA(TypeMatcher<InvalidActionException>()));
  });

  test('Do you have more experience screen error', () {
    var screen = YouHaveMoreExperienceScreen();

    expect(() => navigator.navigate(screen, Yes()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, No()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheAgreedToExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheRefusedExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, IDidNotAskPermission()), throwsA(TypeMatcher<InvalidActionException>()));
  });

  test('Most men with her education would know screen error', () {
    var screen = MostMenWithHerEducationWillKnowThisScreen();

    expect(() => navigator.navigate(screen, IHaveMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, AboutTheSameExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheHasMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheIsAnExpert()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheAgreedToExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheRefusedExplanation()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, IDidNotAskPermission()), throwsA(TypeMatcher<InvalidActionException>()));
  });

  test('Did you ask permission to explain screen error', () {
    var screen = YouAskedIfSheNeedsExplanationScreen();

    expect(() => navigator.navigate(screen, IHaveMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, AboutTheSameExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheHasMoreExperience()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, SheIsAnExpert()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, Yes()), throwsA(TypeMatcher<InvalidActionException>()));
    expect(() => navigator.navigate(screen, No()), throwsA(TypeMatcher<InvalidActionException>()));
  });
}