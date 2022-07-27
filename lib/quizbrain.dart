import 'package:quiz_app_2/questions.dart';

class QuizBrain{
  //This keeps track of our questions
  int _questionNumber = 0;
  //This list contains all of our questions.
  final List<Question> _questionBank = [
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(q: 'No piece of square dry paper can be folded in half more than 7 times.', a: false),
    Question(q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', a: true),
    Question(q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', a: false),
    Question(q: 'The total surface area of two human lungs is approximately 70 square metres.', a: true),
    Question(q: 'Google was originally called "Backrub".', a: true),
    Question(q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', a: true),
    Question(q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', a: true),
  ];

  // This gets our question text and would be displayed on the screen in the main.dart.
  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }
  // This gets our question answer
  bool getAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  // This takes us to the next question.
  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }
  // This checks to see if we are out of questions in the questionBank.
  bool isFinished(){
    if(_questionNumber >= _questionBank.length -1){
      return true;
    }else{
      return false;
    }
  }
  // This resets our _questionNumber back to 0.
  void reset(){
    _questionNumber = 0;
  }
}