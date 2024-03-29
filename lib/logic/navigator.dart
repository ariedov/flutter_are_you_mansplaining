import 'package:mansplaining/logic/answer.dart';
import 'package:mansplaining/logic/exceptions.dart';
import 'package:mansplaining/logic/screens.dart';

class NavigatorReducer {
  Screen get first => new DidSheAskToExplainThisScreen();

  Screen navigate(Screen screen, Answer action) {
    switch (screen.runtimeType) {
      case DidSheAskToExplainThisScreen:
        return _screenForDidSheAskToExplain(action);
      case YouHaveMoreExperienceScreen:
        return _screenForYouHaveMoreExperience(action);
      case MostMenWithHerEducationWillKnowThisScreen:
        return _screenForMostMenWithHerEducationWouldKnow(action);
      case YouAskedIfSheNeedsExplanationScreen:
        return _screenForYouAskedIfSheNeedsExplanation(action);
      default:
        throw NoSuchScreenException();
    }
  }

  _screenForDidSheAskToExplain(Answer action) {
    switch (action.runtimeType) {
      case Yes:
        return NotMansplainingScreen();
      case No:
        return YouHaveMoreExperienceScreen();
      default:
        throw InvalidActionException();
    }
  }

  _screenForYouHaveMoreExperience(Answer action) {
    switch (action.runtimeType) {
      case IHaveMoreExperience:
        return MostMenWithHerEducationWillKnowThisScreen();
      case AboutTheSameExperience:
        return ProbablyMansplainingScreen();
      case SheHasMoreExperience:
        return DefinitelyMansplainingScreen();
      case SheIsAnExpert:
        return StopNowScreen();
      default:
        throw InvalidActionException();
    }
  }

  _screenForMostMenWithHerEducationWouldKnow(Answer action) {
    switch (action.runtimeType) {
      case Yes:
        return ProbablyMansplainingScreen();
      case No:
        return YouAskedIfSheNeedsExplanationScreen();
      default:
        throw InvalidActionException();
    }
  }

  _screenForYouAskedIfSheNeedsExplanation(Answer action) {
    switch (action.runtimeType) {
      case SheAgreedToExplanation:
        return NotMansplainingScreen();
      case SheRefusedExplanation:
        return StopNowScreen();
      case IDidNotAskPermission:
        return ProbablyMansplainingScreen();
      default:
        throw InvalidActionException();
    }
  }
}
