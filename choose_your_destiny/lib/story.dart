import 'dart:ffi';

class Story {
  String title;
  String c1;
  String c2;

  Story({String storyTitle, String choice1, String choice2}){
    title = storyTitle;
    c1 = choice1;
    c2 = choice2;
  }
}
