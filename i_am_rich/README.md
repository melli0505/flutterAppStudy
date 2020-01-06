# I am rich - how to create flutter app from scratch

<a>  https://www.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/14481952#overview 

## creating new flutter project

```dart
import 'package:flutter/material.dart';

//The main function is the starting point for all our flutter apps
void main() { //app launch
  runApp(
    MaterialApp( //google design source
      home: Center( //make material located on center of screen
        child: Text('Hello World'), //text
      ),
    ),
  );
}

```

- 콤마(,) 기호를 사용해서 한줄에 입력한 코드를 자동 서식정리 해줄 수 있다. 우클릭 후 문서서식 선택.
- main문은 flutter app 이 시작하는 곳이다.
- runapp함수를 이용해서 실행된다. -> myapp 등등 다른 걸로도 가능하다.
- 표기는 void main() => runApp()이렇게 하기도 한다.
- materialApp은 구글에서 제공하는 디자인소스다.
- center은 하위 트리의 노드를 화면 중앙에 배치하겠다는 뜻이다.
- child는 위 코드의 자식노드라는 뜻이다.

## scaffolding a flutter app

- scaffold는 정말 많은(appBar등) 부가기능을 포함할 수 있다.
- appBar는 좌측 버튼, 우측버튼, 여유공간, 하단버튼, 타이틀 등 다양한 내용을 제공하며, 색이나 크기도 조정가능하다.
- material design에 색도 있다. 
- scaffold 안에 AppBar라는 위젯을 생성하는 것.
- image() widget
    - 이미지를 가져오는데는 두가지 방법이 있는데, 첫째는 프로젝트 폴더 안에 이미지를 옮겨두고 가져오는 방법이 있고 둘째는 NetworkImage(url)을 이용해서 온라인 이미지를 가져오는 것

```dart
import 'package:flutter/material.dart';

//The main function is the starting point for all our flutter apps
void main() { //app launch
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Image(
            image: NetworkImage('https://data.whicdn.com/images/331537931/original.jpg'),
          ),
        ),
      ),
    ),
  );
}

```

<image> ![image-20200103235656800](C:\Users\KangDain\AppData\Roaming\Typora\typora-user-images\image-20200103235656800.png)



## working with assets in flutter & the pubspec file

- 이미지를 네트워크 연결없이 쓰고싶으면 해당 프로젝트 폴더에 폴더생성 후 거기다가 넣어두고 pubspec.yaml에 assets 추가!

- ```dart
    assets:
    	- images/diamond.png
    ```

- yaml 파일에서는 // 이 아니라 # 으로 comment 해야한다.

- 들여쓰기 매우 조심해야한다. 들여쓰기로 구분하기 때문. (2 space bar basic)

    ctrl + / 가 한번에 주석 달기/해제

- 만약 폴더 안에 있는 모든 이미지를 가져오고 싶으면 폴더만 입력하면 된다.

- ```dart
    assets:
    	- images/
    ```



## How to Add App Icons to IOS and Android Apps

- 앱 아이콘으로 쓸 이미지를 다운받은 후 appicon.co 사이트에서 사이즈별로, ios/android별로 가공해 압축해제한다.

- android/app/src/main/res 폴더로 들어가 그 안에 mipmap으로 된 폴더를 전부 삭제하고 다운받은 폴더/android에 mipmap 으로 된 폴더로 대체한다.

- 이때 주의할 점은 build/app/intermediates/merged_manifests/debug/processDebugManifest/merged/AndroidManifest.xml 파일 안의 이름이다. 

- ```dart
    <application
            android:name="io.flutter.app.FlutterApplication"
            android:debuggable="true"
            android:icon="@mipmap/ic_launcher"
            android:label="i_am_rich" >
            <activity
                android:name="com.daina.i_am_rich.MainActivity"
                android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
                android:hardwareAccelerated="true"
                android:launchMode="singleTop"
                android:theme="@style/LaunchTheme"
                android:windowSoftInputMode="adjustResize" >
    
    ```

- application 부분의 **android::icon = @mipmap/ic_launcher** 이라고 되어있는 부분에 mipmap 다음 파트의 이름과 android/app/src/main/res 폴더 안에 있는 mipmap 폴더 안의 파일 이름이 같아야한다. ~~이것 때문에 고생 오래했다~~ 

