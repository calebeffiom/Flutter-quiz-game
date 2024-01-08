import 'package:flutter/material.dart';
import 'package:quizzer/question.dart';


class Quiz_brain{
   
   final List <Question> _questionList = [
        Question(q: "A slug's blood is green.", a: true),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: true),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: true),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: true),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: false),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: true),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: false),
        Question(q: "Google was originally called 'Backrub'.", a: true),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: true),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: false),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: false),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: true)
 ];
 int _trackerNumber = 0;
 late List<Icon>icons = [];
  



 String getText(){
  return _questionList[_trackerNumber].questionText;
  }

  bool getAnswer(){
    return _questionList[_trackerNumber].answer;
  }

  int increaseTrackingNum(){
    return _trackerNumber++; 
  }
  int resetTrackingNum(){
    return _trackerNumber = 0;
  }
  int getTrackingNum(){
    return _trackerNumber;
  }
  int listlenght(){
    return _questionList.length;
  }


  


 void correctAnswer(bool userAnswer){
  if(getAnswer() == userAnswer){
    return icons.add(Icon(Icons.check, color: Colors.green,));
  }
  else{
    return icons.add(Icon(Icons.close, color: Colors.red,));
  }
}


}
