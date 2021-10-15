abstract class Answer {
  final String name;

  Answer(this.name);
}

class Yes extends Answer {
  Yes() : super('Yes.');
}

class No extends Answer {
  No() : super('No.');
}

class IHaveMoreExperience extends Answer {
  IHaveMoreExperience() : super('Yes, by a fair amount.');
}

class AboutTheSameExperience extends Answer {
  AboutTheSameExperience() : super('About the same, or I don\'t know');
}

class SheHasMoreExperience extends Answer {
  SheHasMoreExperience() : super('She has more.');
}

class SheIsAnExpert extends Answer {
  SheIsAnExpert() : super('She has more, and is a well known expert.');
}

class SheAgreedToExplanation extends Answer {
  SheAgreedToExplanation() : super('Yes, she said she did.');
}

class IDidNotAskPermission extends Answer {
  IDidNotAskPermission() : super('I did not ask.');
}

class SheRefusedExplanation extends Answer {
  SheRefusedExplanation() : super('Yes, she said no.');
}
