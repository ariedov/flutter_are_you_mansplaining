abstract class Action {

  final String name;

  Action(this.name);
}

class Yes extends Action {
  Yes() : super('Yes.');
}

class No extends Action {
  No() : super('No.');
}

class IHaveMoreExperience extends Action {
  IHaveMoreExperience() : super('Yes, by a fair amount.');
}

class AboutTheSameExperience extends Action {
  AboutTheSameExperience() : super('About the same, or I don\'t know');
}

class SheHasMoreExperience extends Action {
  SheHasMoreExperience() : super('She has more.');
}


class SheIsAnExpert extends Action {
  SheIsAnExpert() : super('She has more, and is a well known expert.');
}

class SheAgreedToExplanation extends Action {
  SheAgreedToExplanation() : super('Yes, she said she did.');
}

class IDidNotAskPermission extends Action {
  IDidNotAskPermission() : super('I did not ask.');
}

class SheRefusedExplanation extends Action {
  SheRefusedExplanation() : super('Yes, she said no.');
}