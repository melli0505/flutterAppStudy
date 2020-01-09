# Dicee : Building Apps with State

## Using the Expanded Widget to Create Flexible Layouts

- ```dart
    class DicePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }
    ```

- flutter에서 class는 일종의 함수처럼 쓰인다고 볼 수 있다. 메인 함수를 축약시키기 위한 수단이다. 이때 build()의 역할은 hot reload나 restart를 할 때 실행에 포함되는 부분이라는 뜻이다.

- 만약 앱 안에 포함되는 요소가 너무 커서 스크린을 넘어갈 경우, 노랑과 검정으로 된 선으로 overflow를 표시한다.

- expanded widget은 해당 이미지 혹은 요소를 확장시켜주는데, overflow없이 화면에 딱 맞는 크기까지 최대로 확장시켜주는 역할을 한다. 만약 expanded widget이 row 안에 두 개가 들어간다면 두 개의 크기를 같게, 최대한 크게 가로로 나열해준다.

- expanded widget에 flex를 추가하면 비율을 설정할 수 있다.

- ```dart
    children: <Widget>[
            Expanded(
              flex: 2,
              child: Image(  
                image: AssetImage('images/dice1.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Image(  
                image: AssetImage('images/dice1.png'),
              ),
            ),
          ],
    ```

- expanded widget without flex / expanded widget with flex 2 : 1

<img src="C:\Users\KangDain\Documents\카카오톡 받은 파일\KakaoTalk_20200108_191848248.jpg" alt="KakaoTalk_20200108_191848248" style="zoom:25%;" /><img src="C:\Users\KangDain\Documents\카카오톡 받은 파일\KakaoTalk_20200108_191908175.jpg" alt="KakaoTalk_20200108_191908175" style="zoom:25%;" />

- 여태껏 Image를 추가할 때 썼던 

    ```dart
    Image(
      image: AssetImage('images/dice1.png'),
    )
    ```

    를 보다 쉬운 방법으로 아래와 같이 전환할 수 있다.

    ```dart
    Image.asset('images/dice1.png'),
    ```

## How to use intention Action

- intention action은 widget 이름을 눌렀을 때 표시되는 전구모양과 android studio 좌측에 있는 flutter outline을 이용해 간편하게 코드를 편집하는 방법이다.
- 간편하게 위젯이나 기능을 추가할 수 있고 삭제도 가능하며, 위치를 편집하는 것 또한 매우 간단하다.
- 단, vscode에서는 제공하지 않는 기능도 존재하나 그럴 경우에는 수작업으로 변경 이후 문서서식(shift + alt + f)를 이용해 정렬해줄 수 있다.
- 만약 padding을 추가하려고 하면 어디에 추가해야할지를 잘 생각해야한다. 일예로 

## Adding gesture detection with flutter button widgets

- button 위젯은 말 그대로 사용자의 조작에 반응하는 위젯이다. 다양한 버튼이 존재하는데, 이것은 www.fluter.dev 에서 확인할 수 있다.

- ```dart
    Expanded(
      child: FlatButton(
        child: Image.asset('images/dice1.png'),
      ),
    ),
    ```

- 이 코드에서 작성된 flat button 같은 경우에는 기본적으로 horizontal padding이 16픽셀씩 들어가있기 때문에 불필요한 padding 위젯은 삭제해주었다.

- flatButton을 포함한 모든 button 위젯에는 필수 요구사항으로 onPressed가 있다. onPressed는 어떠한 데이터를 필요로하지 않는다. 그러나 버튼이 눌렸을 때 어떠한 반응을 보일지를 정하는 파트라고 할 수 있다.

- ```dart
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    print('left button got pressed.');
                  },
                  child: Image.asset('images/dice1.png'),
                ),
              ),
    ```

- 이 경우 버튼을 눌렀을 때 디버그 콘솔 창에 버튼이 눌릴 때마다 위와같은 텍스트가 출력된다. 그러나 앱 화면에는 아무런 변화가 나타나지 않기 때문에, 우리는 이미지 등의 변화를 줄 필요가 있다.

## Making the dice image change reactively

- 어떠한 항목의 특정 부분만 바꾸고 싶을 때 우리는 variable 변수를 사용할 수 있다. 이 경우에, var형으로 선언된 변수에 값을 할당하고, 그 변수값이 들어가는 자료의 부분에 <strong>$</strong> 표시 후 변수명을 적으면 적용된다.

- ```dart
    var leftDiceNumber = 1;
    Image.asset('images/dice$leftDiceNumber.png')
    ```

- 선언할 때 주의해야할 점은 variable 변수를 widget build 바깥에 적용했을 경우 hot reload로는 반영되지 않는다는 점이다. 자주 바뀌는 경우 build 안에 넣어주는 편이 좋다.

- 만약 build 바깥에 선언했다면, build 안에서 그 값을 수정하는 것은 가능하다.

- ```dart
    class DicePage extends StatelessWidget {
      int leftDiceNumber = 6;
      int rightDiceNumber = 2;
      @override
      Widget build(BuildContext context) {
        leftDiceNumber = 2;
        rightDiceNumber = 1;
    ```

- 그러나 이 경우에 DicePage라는 class에는 문제가 생기는데, 그 이유는 DicePage가 stateless widget이기 때문이다. stateless widget은 한 번 생성하고 나면 이후에 상태가 변하지 않는 요소들로 구성된다. stateless widget은 어떤 것도 바뀌지 않게 보호되는 박물관과 같다.

- 어떠한 상태변화가 필요한 경우, 우리는 stateful widget을 사용하는 것이 옳다. 코드로가 아닌 사용자의 조작으로 인해 앱의 화면이 바뀔 때 사용한다.

- ```dart
    class DicePage extends StatefulWidget {
      @override
      _DicePageState createState() => _DicePageState();
    }
    
    class _DicePageState extends State<DicePage> {
    ```

- stful 이라고 입력하면 flutter에서 자동적으로 stateful widget의 틀을 제공해주는데, 그에 맞추어 사용하면 된다. 아래는 말 그대로 DicePage의 상태를 나타내는 위젯이고, 이 부분에 stateless widget에 입력한 내용들을 쓰면 된다.

- ```dart
    onPressed: (){
      setState(() {
        leftDiceNumber = 5;
      });
    }
    ```

- 여기서 만약 setState를 사용하지 않았다면 우리는 hot reload 혹은 hot restart 이후에 다시 한 번 앱을 재시작해야한다. 왜냐하면 reload 나 restart는 변경사항을 확인하고 반영하는 것이기 때문에, 확실하게 디스플레이가 변경되려면 한 번 더 같은 과정을 거쳐야한다.

- 그러나 setState를 사용하면 사용 자체만으로도 데이터가 바뀌었다라는 뜻이기 때문에 한 번의 restart 만으로 바로 디스플레이에 변화를 보여줄 수 있다. 또한 setState는 비동기형식이기 때문에 자주자주 쉽게 바꿀 수 있다.

- 따라서 만약 flat button 을 누르면, 코드는 leftDiceNumber가 바뀌었음을 확인하고, leftDiceNumber가 사용된 곳을 찾은 후 앱을 전체 화면에 다시 표시한다.

- 버튼을 누름으로써 트리거가 당겨지면 실행 과정에서 setState를 만나게 되고, 그 때 앱은 build 안에 있는 내용을 redraw 하는 것이다.

## Randomising the dice

- 숫자를 랜덤으로 지정하기 위해서는 새로운 라이브러리가 필요하다.(라이브러리와 헤더파일은 같은  뜻이다) 바로 math 라이브러리다.

- ```dart
    import 'dart:math';
    ```

- math 헤더를 import 했다면 Random 함수를 사용할 수 있다. www.docs.flutter.dev에 가면 math 라이브러리 아래에 Random 함수를 찾을 수 있는데, Random 함수 다음에는 nextDouble, nextInt 등을 사용할 수 있다. next 괄호 안에는 범위를 지정할 수 있다. 만약 nextInt 안에 6이라고 적으면, 자동으로 0부터 5까지 5개의 숫자를 범위로 지정하게 된다. 따라서 숫자를 정하는 것은 +n 혹은 -n을 이용해서 범위를 조절할 수도 있다.

- ```dart
    Random().nextInt(6)+1;
    ```

## Challenge

- 하나의 버튼을 누를 때 다른 state도 함께 변하게 하는 방법은 간단히 다른 부분의 setState를 함께 변하도록 지정해주면 된다.
- 함수를 통해 겹치는 부분을 묶어줌으로써 더 짧고 효율적인 코드를 완성할 수 있다. 그러나 주의할 점은 widget 안에 있는 요소가 함수 내부에 쓰인다면 반드시 widget 안에 함수를 만들어야한다는 점이다.

