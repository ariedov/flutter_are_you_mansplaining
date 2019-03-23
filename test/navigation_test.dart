import 'package:mansplaining/action.dart';
import 'package:mansplaining/navigator.dart';
import 'package:mansplaining/screens.dart';
import 'package:test_api/test_api.dart';

void main()
{
  var navigator = new Navigator();

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
}