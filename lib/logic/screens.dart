import 'package:mansplaining/logic/action.dart';

abstract class Screen {

  String get title;
}

abstract class ActionableScreen extends Screen {

  List<Action> get actions;
}

class DidSheAskToExplainThisScreen extends ActionableScreen {

  @override
  String get title => "Did she ask you to explain it?";

  @override
  List<Action> get actions => [No(), Yes()];
}

class YouHaveMoreExperienceScreen extends ActionableScreen {

  @override
  String get title => "Do you have more relevant experience?";

  @override
  List<Action> get actions => [
    SheIsAnExpert(),
    SheHasMoreExperience(),
    AboutTheSameExperience(),
    IHaveMoreExperience()];
}

class MostMenWithHerEducationWillKnowThisScreen extends ActionableScreen {

  @override
  String get title => "Would most men with her education & experience already know this?";

  @override
  List<Action> get actions => [No(), Yes()];
}

class YouAskedIfSheNeedsExplanationScreen extends ActionableScreen {

  @override
  String get title => "Did you ask if she needed it explained?";

  @override
  List<Action> get actions => [SheRefusedExplanation(), IDidNotAskPermission(), SheAgreedToExplanation()];
}

class NotMansplainingScreen extends Screen {

  @override
  String get title => "Not mansplaining.";

}

class ProbablyMansplainingScreen extends Screen {

  @override
  String get title => "Probably mansplaining.";

}

class DefinitelyMansplainingScreen extends Screen {

  @override
  String get title => "Definitely mansplaining.";

}

class StopNowScreen extends Screen {

  @override
  String get title => "Just stop talking now.";

}