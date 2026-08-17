enum QuestionType { multipleChoice, textInput, numberInput }

class Question {
  final String id;
  final String text;
  final QuestionType type;
  final List<String>? options; // Required if multipleChoice
  final String correctAnswer;
  final String hint;

  const Question({
    required this.id,
    required this.text,
    required this.type,
    this.options,
    required this.correctAnswer,
    required this.hint,
  });
}

class Activity {
  final String id;
  final String title;
  final String icon;
  final List<Question> questions;

  const Activity({
    required this.id,
    required this.title,
    required this.icon,
    required this.questions,
  });
}

class Week {
  final String id;
  final String title;
  final List<Activity> activities;

  const Week({
    required this.id,
    required this.title,
    required this.activities,
  });
}

class Term {
  final String id;
  final String title;
  final List<Week> weeks;

  const Term({
    required this.id,
    required this.title,
    required this.weeks,
  });
}

class Subject {
  final String id;
  final String title;
  final String icon;
  final List<Term> terms;

  const Subject({
    required this.id,
    required this.title,
    required this.icon,
    required this.terms,
  });
}

class Grade {
  final String id;
  final String title;
  final List<Subject> subjects;

  const Grade({
    required this.id,
    required this.title,
    required this.subjects,
  });
}
