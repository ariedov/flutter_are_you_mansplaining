import 'package:mansplaining/logic/answer.dart';
import 'package:mansplaining/logic/status.dart';

abstract class Screen {
  String get title;
}

abstract class ActionableScreen extends Screen {
  List<Answer> get actions;
}

abstract class ResultScreen extends Screen {
  Status get status;
}

class DidSheAskToExplainThisScreen extends ActionableScreen {
  @override
  String get title => "Did she ask you to explain it?";

  @override
  List<Answer> get actions => [No(), Yes()];
}

class YouHaveMoreExperienceScreen extends ActionableScreen {
  @override
  String get title => "Do you have more relevant experience?";

  @override
  List<Answer> get actions => [
        SheIsAnExpert(),
        SheHasMoreExperience(),
        AboutTheSameExperience(),
        IHaveMoreExperience()
      ];
}

class MostMenWithHerEducationWillKnowThisScreen extends ActionableScreen {
  @override
  String get title =>
      "Would most men with her education & experience already know this?";

  @override
  List<Answer> get actions => [No(), Yes()];
}

class YouAskedIfSheNeedsExplanationScreen extends ActionableScreen {
  @override
  String get title => "Did you ask if she needed it explained?";

  @override
  List<Answer> get actions => [
        SheRefusedExplanation(),
        IDidNotAskPermission(),
        SheAgreedToExplanation()
      ];
}

class NotMansplainingScreen extends ResultScreen {
  @override
  Status get status => Status.Good;

  @override
  String get title => "Not mansplaining.";
}

class ProbablyMansplainingScreen extends ResultScreen {
  @override
  Status get status => Status.Bad;

  @override
  String get title => "Probably mansplaining.";
}

class DefinitelyMansplainingScreen extends ResultScreen {
  @override
  Status get status => Status.Terrible;

  @override
  String get title => "Definitely mansplaining.";
}

class StopNowScreen extends ResultScreen {
  @override
  Status get status => Status.Disaster;

  @override
  String get title => "Just stop talking now.";
}
