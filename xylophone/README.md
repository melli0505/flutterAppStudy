# Xylophone - Using Flutter and Dart packages to speed up development

## What are Flutter & Dart Package?

- 플러터 패키지는 다른 플러터 개발자들이 만들어둔 오픈소스 라이브러리이고, 더 나은 효율을 추구한다.

- www.pub.dartlang.org/flutter

- 사이트에서 패키지를 검색할 수 있고, 최근 버전과 적용방법에 대해서도 쉽게 확인할 수 있다. 

- 패키지를 설치하기 위해서는 yaml 파일을 수정하고 pub get 하면 된다.

- ```dart
    dependencies:
    	english_words //flutter에게 이 패키지를 사용할 것이라는 것을 명시함
         audioplayers: ^0.10.0 // flutter에게 이 버전을 사용할 것이라는 것을 명시함
    //이후 터미널에 pub get 입력하면 자동으로 패키지를 설치해준다.
    ```

- flutter doc의 using package에서 확인 가능하다. (UsingPackage.md 확인)

- 그리고 import 해준다

- ```dart
    mport 'package:audioplayers/audioplayers.dart';
    ```



## How to Play Sound across platforms	

- audioplayers를 사용해서 flatbutton을 누르면 음악이 재생되도록 하기 위해서는 플레이어를 만들어주어야한다. 패키지에서 제공하는 audio cache를 final 변수로 할당해준 다음, 해당 변수(플레이어)에서 재생할 파일을 적어준다.

- ```dart
                    final player = AudioCache();
                    player.play('note1.wav');
    ```

- 원래대로라면 파일 명을 적을 때 폴더 이름까지 써주는 것이 맞지만, audioplayers 패키지에는 assets 폴더가 기본 세팅되어있기 때문에 적어주지 않아도 무방하다.
- 따라서 패키지를 잘 살펴보고 양식에 맞추어 폴더 구조를 만들어야한다.



## How to Play multiple sound

- 함수를 만드는 것은 코드를 절약하는 좋은 방법이다. 아래와 같은 부분이 중복된다고 하면, 우리는 함수를 만들어 쉽게 처리할 수 있다.

- ```dart
                    final player = AudioCache();
                    player.play('note1.wav');
    ```

- ```dart
    void SoundSet(){
        final player = AudioCache();
        player.play('note1.wav');
    }
    ```

- 위와 같이 작성할 경우 생기는 문제점은 각 함수가 쓰일 때 모두 note1.wav를 출력한다는 점이다. 이때, 우리는 함수에 input을 추가해줄 수 있다.

- ```dart
    void SountSet(int soundNumber){
        final player = AudioCache();
        player.play('note$soundNumber.wav');
    }
    
    SountSet(3);
    ```

- 이렇게 하면 괄호 안에 들어가는 정수로 파일 이름이 지정되기 때문에 문제를 해결할 수 있다.



## Updating the UIs of our app

- 각 버튼들을 늘려주기 위해서 Column 아래 cross Axis Alignment를 추가해주었다.

- ```dart
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
    ```

- 이렇게 세로로 최대로 늘려준 다음 Expanded를 이용해 각 칸을 가로 최대로 넓혀주었다.

- 마찬가지로 Expanded 부분도 함수로 축약이 가능하다.

- ```dart
     Expanded buildKey(int sound, Color color, Text str) {
        return Expanded(
          child: FlatButton(
            color: color,
            onPressed: () {
              playSound(sound);
            }, 
            child: Text('$str'),//Text 부분 수정 전
          ),
        );
      }
    ```

- 반환해줘야할 것이 Expanded이기 때문에 함수 또한 Expanded 형으로 만들어준다. 

- Color 이라는 자료형(?)이 있다. 사용 방법은 타언어와 같다.

- 함수 안에서 함수를 불러 사용하는 것이 가능하다.

