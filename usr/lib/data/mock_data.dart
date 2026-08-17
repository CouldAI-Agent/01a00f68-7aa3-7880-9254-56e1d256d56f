import '../models/curriculum.dart';

class MockData {
  static const appCurriculum = [
    Grade(
      id: 'g2',
      title: 'Grade 2',
      subjects: [
        Subject(
          id: 's_num',
          title: 'Numeracy',
          icon: '🔢',
          terms: [
            Term(
              id: 't1',
              title: 'Term 1',
              weeks: [],
            ),
            Term(
              id: 't2',
              title: 'Term 2',
              weeks: [],
            ),
            Term(
              id: 't3',
              title: 'Term 3',
              weeks: [
                Week(
                  id: 'w1',
                  title: 'Week 1',
                  activities: [
                    Activity(
                      id: 'a_num_det',
                      title: 'Number Detective',
                      icon: '🕵️',
                      questions: [
                        Question(
                          id: 'q1',
                          text: 'What is 5 + 3?',
                          type: QuestionType.multipleChoice,
                          options: ['6', '7', '8', '9'],
                          correctAnswer: '8',
                          hint: 'Try counting on your fingers: 5... 6, 7, 8!',
                        ),
                        Question(
                          id: 'q2',
                          text: 'Type the number word for 12:',
                          type: QuestionType.textInput,
                          correctAnswer: 'twelve',
                          hint: 'It starts with "tw" and ends with "elve".',
                        ),
                        Question(
                          id: 'q3',
                          text: 'Enter the missing number: 10, 20, __, 40',
                          type: QuestionType.numberInput,
                          correctAnswer: '30',
                          hint: 'We are counting by tens. What comes after 20?',
                        ),
                      ],
                    ),
                    Activity(
                      id: 'a_shapes',
                      title: 'Shape Sorter',
                      icon: '🔺',
                      questions: [], // Empty for now
                    ),
                  ],
                ),
                Week(
                  id: 'w2',
                  title: 'Week 2',
                  activities: [],
                ),
              ],
            ),
          ],
        ),
        Subject(
          id: 's_lit',
          title: 'Literacy',
          icon: '📚',
          terms: [],
        ),
      ],
    ),
  ];
}
