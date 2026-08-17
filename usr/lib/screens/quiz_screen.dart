import 'package:flutter/material.dart';
import '../models/curriculum.dart';

class QuizScreen extends StatefulWidget {
  final Activity activity;
  const QuizScreen({super.key, required this.activity});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  String? _feedback;
  bool _isCorrect = false;
  final TextEditingController _textController = TextEditingController();

  void _checkAnswer(String answer) {
    final question = widget.activity.questions[_currentIndex];
    final isRight = answer.trim().toLowerCase() == question.correctAnswer.trim().toLowerCase();

    setState(() {
      _isCorrect = isRight;
      _feedback = isRight ? "Correct! Great job!" : "Try again. Hint: ${question.hint}";
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentIndex < widget.activity.questions.length - 1) {
        _currentIndex++;
        _feedback = null;
        _isCorrect = false;
        _textController.clear();
      } else {
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Activity Complete! 🎉", style: TextStyle(fontSize: 24)),
        content: const Text("You finished all the questions! You are a star!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              Navigator.of(context).pop(); // go back to activity list
            },
            child: const Text("Yay!", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.activity.questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (_currentIndex + 1) / widget.activity.questions.length,
                minHeight: 12,
                borderRadius: BorderRadius.circular(6),
              ),
              const SizedBox(height: 24),
              Text(
                "Question ${_currentIndex + 1} of ${widget.activity.questions.length}",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                question.text,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (question.type == QuestionType.multipleChoice)
                ...question.options!.map((opt) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 24),
                        ),
                        onPressed: _isCorrect ? null : () => _checkAnswer(opt),
                        child: Text(opt),
                      ),
                    ))
              else
                TextField(
                  controller: _textController,
                  keyboardType: question.type == QuestionType.enterNumber ? TextInputType.number : TextInputType.text,
                  style: const TextStyle(fontSize: 24),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your answer",
                  ),
                  enabled: !_isCorrect,
                  onSubmitted: _checkAnswer,
                ),
              if (question.type != QuestionType.multipleChoice && !_isCorrect)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                    onPressed: () => _checkAnswer(_textController.text),
                    child: const Text("Check Answer"),
                  ),
                ),
              const Spacer(),
              if (_feedback != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _feedback!,
                    style: TextStyle(
                      fontSize: 20,
                      color: _isCorrect ? Colors.green.shade900 : Colors.red.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (_isCorrect) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _nextQuestion,
                  child: const Text("Next Question"),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
