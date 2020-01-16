import 'question.dart';

class QuizBrain{
  
  bool _finish = false;
  int _questionNumber = 0;
  List<Question> _quizBrain = [
    Question(q: 'The HUFS DSC was first launched in  2019.', a: true),
    Question(q: 'All of DSC members are under 4th grade.', a: false),
    Question(
        q: 'Computer Electronic System Engineering department will be renamed as Computer Engineering departmaet.',
        a: true),
    Question(q:'Some cats are actually allergic to humans', a:true),
    Question(q:'You can lead a cow down stairs but not up stairs.', a:false),
    Question(q:'Approximately one quarter of human bones are in the feet.',a: true),
    Question(q:'A slug\'s blood is green.', a:true),
    Question(q:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',a: true),
    Question(q:'It is illegal to pee in the Ocean in Portugal.',a: true),
    Question(
        q:'No piece of square dry paper can be folded in half more than 7 times.',
        a:false),
    Question(
        q:'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a:true),
  ];


  void nextQuestion(){
    if(_questionNumber < _quizBrain.length - 1) _questionNumber++;
  }

  String getQuestionText(){
    return _quizBrain[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _quizBrain[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber >= _quizBrain.length - 1) _finish = true;
    print('Now returning finished.');
    return _finish;
  }

  void resetQuestion(){
    _questionNumber = 0;
  }
}