# MiCard - How to build beautiful UIs with Flutter Widget

- github에서 코드를 받아오면, android studio에서 check out project version control -> git을 선택한 후 코드를 받은 repository의 주소와 파일을 생성할 폴더를 선택해준 후 열고 flutter pub get해주면 적용된다.

## Hot Reload and Hot Restart

- write code -> test code의 과정을 반복한다.
- hot reload는 코드의 업데이트된 부분을 캐치해서 바로 반영해주는 것. 훨씬 적은 시간과 파워를 요구한다. (실재로 보여지는 시간차만 해도 10초 이상)
- 데이터를 잃지 않고 UI를 업데이트할 때 좋다.
- hot restart는 앱의 상태를 reset하는 것이다. 초기상태로 되돌리는 것인데, UI를 바꿔주는 것 뿐만아니라 카운팅하던 상태 등을 모두 초기로 되돌려준다.
- test 를 위해서 사용하는 매우 실용적인 것들인데, 전부를 재실행하는 것보다 일부를 추가해주는 것으로 효율을 추구한다. 

## How to Use Container Widgets

- container widget은 사각형 칸이라고 생각하면 편하다. 움직일 수 있고, 색을 바꿀 수 있으며 안에 다른 요소를 포함시키기도 가능하다.

- layout widget 에는 single child widget과 multi child widget이 있다. 플러터 공식문서에서 확인할 수 있다.

- www.docs.flutter

- container은 기본적으로 왼쪽 상단에, 작은 사이즈로 생성된다. 이때 notch나 아래(앱의 요소가 현상되어서는 안되는 부분)에 생성되지 않게 하기 위해서는 container부분을 아예 새로운 widget 하나로 묶어주면 된다. container에 커서를 가져다대면 뜨는 전구모양에서 wrap 을 선택해주면 별다른 타이핑 없이도 쉽게할 수 있다.

- ```dart
    void main() {
      runApp(
        MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: Text('hello'),
              ),
            ),
          ),
        ),
      );
    }
    ```

- container 주변에 여백을 주고 싶다면 margin의 EdgeInsets 을 사용하면 된다.

- ```dart
    child: Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.symmetric(vertical: 50.0,
                horizontal: 10.0),
                color: Colors.white,
                child: Text('hello'),
              ),
    ```

- EdgeInsets  뒤에는 여러가지 커맨드가 붙을 수 있는데, symmetric 키워드를 사용하면 대칭적인 여백을 만들 수 있다. symmetric 의 괄호 안에는 vertical 과 horizontal이 들어가는데, 각각 세로와 가로라는 뜻으로 위에서는 위아래에 50, 양옆에 10의 여백을 주는 것이다.

- 만약 fromLTRB를 사용하면 각각 left top right bottom에 줄 여백을 순서대로 괄호안에 입력하면 된다.

- only를 사용하면 어디에 여백을 줄지 이름을 적고 : 이후에 숫자를 입력한다.

- padding은 상자 안에 있는 요소와 상자의 테두리를 어느정도의 공간으로 둘러싸는 것을 말한다. margin과 마찬가지로 EdgeInsets를 사용한다. 

- margin은 바깥의 여백이고 padding은 내부의 여백이다. 

## How to use Column & Row Widgets for Layout

- 일반 container 위젯은 single child를 갖는다. 

- 그러나 Row, Column, Stack을 이용하면 여러가지 container를 child로 가질 수 있다. (multi child widget)

- ```dart
    child: Column(
                children: <Widget>[
                  Container(
                   height: 100.0,
                   width: 100.0,
                   color: Colors.white,
                   child: Text('Container 1'),
                  ),
                  Container(
                    width:  100.0, 
                    height: 100.0 ,
                    color: Colors.blue,
                    child: Text('Container 2'),
                  ),
                  Container(
                    width:  100.0, 
                    height: 100.0 ,
                    color: Colors.red,
                    child: Text('Container 2'),
                  ),
                ],
              ),
    ```

    ### Column

- Colunm아래에는 child가 아닌 children이 들어간다. children 아래에 넣고싶은 것이 위젯이기 때문에 <widget>을 쓰고 아래에 여러 개의 container을 넣은 것을 볼 수 있다. 

- ```dart
    verticalDirection: VerticalDirection.up,
    ```

- 이것을 사용하면 Column으로 묶인 위젯들이 위에 정렬될지 아래에 정렬될지 정할 수 있다. (세로)

- MainAxisSize를 이용하면 세로 여유공간을 최대-최소로 할당할 수 있다.

- mainAxisAlignment 중심선의 시작과 끝에 children을 얼마나 가까이 붙일지 결정할 수 있다. verticalDirection과 비슷하나 중심선이라는 기준이 있다. center을 이용하면 중심선 가운데에 위치한다.

- space Evenly를 사용하면 각 child들과 시작, 끝이 모두 같은 간격으로 정렬한다. spaceBetween은 사용하면 각 child들 사이에만 같은 간격으로 정렬시켜준다.

- <img src="C:\Users\KangDain\AppData\Roaming\Typora\typora-user-images\image-20200107191425246.png" alt="image-20200107191425246" style="zoom:50%;" /><img src="C:\Users\KangDain\AppData\Roaming\Typora\typora-user-images\image-20200107191814492.png" alt="image-20200107191814492" style="zoom:50%;" />

- spaceEvenly / spaceBetween

- crossAxisAlignments는 좌우, 즉 가로정렬을 의미한다. 

- ```dart
    crossAxisAlignment: CrossAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    ```

- start는 가로 기준선의 시작, 즉 왼쪽정렬되고, end는 가장 긴 컨테이너를 기준으로 오른쪽 정렬이 된다. 따라서 만약 container의 크기가 같다면 나타나지 않는다. 그러나 눈에 보이지 않는 container의 width를 double.infinity로 설정하고 crossAxisAllignment가 end로 설정되면 아예 오른쪽 끝에 붙게된다. stretch를 사용하면 각 container를 가로 끝과 끝까지 늘려준다.

- SizedBox를 사용해 container 중간에 공간을 만들어줄 수 있다.

- ```dart
    SizedBox(    height : 20.0,)
    ```

    ### Row

- Row 위젯은 Column과 같은 프로세스를 가로로 수행한다. 

- 이때 crossAxisAlignment역시 같은 역할을 수행하는데, 방향만 가로-세로 전환이다. 예를 들어 crossAxisAlignment: CrossAxisAlignment.stretch 를 사용하게 되면 Column에서는 가로로 늘어났지만 Row에서는 세로로 늘어나게 된다.

## Tapping into Widget Properties

- Column - CircleAvatar는 원을 생성한다. 원의 반지름과 색상을 조정할 수 있고, 색 대신 이미지를 삽입할 수 있다. 이미지 삽입과정은 이전 레슨에서 설명한 바 있다.

- ```dart
    child: Column(
               children: <Widget>[
                 CircleAvatar(
                   radius: 50.0,
                   backgroundImage: AssetImage('image/popGirl.jpg')
                 ),
             ),
    ```

- text 위젯의 경우에는 다양한 추가기능을 제공하는데, 그 중에 TextStyle에서는 폰트 크기, 색, 글꼴 등을 수정할 수 있다.

- ``` dart
    Text(
        'Kang Dain',
        style: TextStyle(
           fontSize: 40.0,
           color: Colors.white,
       ),
    )
    ```

## Incorporating Custum Fonts in Your flutter app

- www.fonts.google.com 에 가면 상업적 이용가능한 구글 폰트들이 나온다. 글꼴을 다운받은 후 image 추가하는 것과 같은 과정을 거친다. 

- pubspec.yaml 파일에 fonts 를 추가해준다.

- ```dart
    fonts:
       - family: Pacifico
         fonts:
           - asset: fonts/Pacifico-Regular.ttf
       - family: SourceSansPro
         fonts:
           - asset: fonts/SourceSansPro-Regular.ttf
    ```

- Text 위젯에는 수많은 요소를 추가할 수 있는데, 폰트를 적용하기 위해서는 fontFamily를 이용한다.

- 이외에도 letterSpacing을 이용해 자간을 조정하고, fontWeight를 이용해 굵기를 조절할 수 있다. Colors.ooo.shade를 이용해 투명도를 조절할 수 있다.

- ```dart
    Text(
      'FLUTTER DEVELOPER',
      style: TextStyle(  
        fontSize:20.0,
        color: Colors.teal.shade100,
        fontFamily: 'SourceSansPro',
        letterSpacing: 2.5,
        fontWeight: FontWeight.bold,
      ),
    )
    ```

## Adding Materail Icons with the Icon widget

- material app 이라는 헤더파일을 사용하고 있으면 이미 google에서 제공하는 몇가지의 아이콘을 사용할 수 있다.

- materialpallete.com에서 확인할 수 있다.

- Icon은 image에서는 사용할 수 없는 color, shade와 같은 기능을 사용할 수 있고, 아주 크게 확대해도 픽셀화되어 깨지지 않기 때문에 이미지보다는 Icon을 사용하는 것을 추천한다.

- ```dart
    Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.phone,
            color: Colors.teal,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '+82 7601 2577',
            style: TextStyle(
            color: Colors.teal.shade900,
            fontFamily: 'SourceSansPro',
            fontSize: 20.0,
          ),
        ],
      ),
    ),
    ```

- padding을 이용해 container 내부 요소들과 테두리 사이의 여백을 만들고, margin을 이용해 container과 외부 요소들의 여백을 만든다.

- Row로 가로형 children을 만들어주고 그 안에 icon, sizedBox, text를 넣는다.

- Icon은 언급한 것과 같이 크기, 색 등을 변경할 수 있다.

- SizedBox는 주로 요소와 요소 사이, 즉 위젯과 위젯 사이의 여백을 인위적으로 만들어줄 수 있다.

## Flutter Card & ListTile Widgets

- card class - 구글에서 제공하는 라운드한 코너의 사각형 컨테이너이고 자동으로 그림자를 갖고 있는 것이다. 그러나 card 에는 padding이 없는데, 이때 padding 위젯을 새로 만드는 방법이 있다. 

- padding 위젯 안에 card 위젯을 만드는 경우에는 margin을 사용하는 것과 같은 효과를 보여준다.

- ```dart
    Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                       child: Row(
                        children: <Widget>[
                          Icon(Icons.email,
                          color: Colors.teal,
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            'dmelli0505@gmail.com',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'SourceSansPro',
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
    ```

- ListTile은 Icon, sizedBox, Text의 기능을 보다 적은 코드를 통해 구현할 수 있도록 돕는다. 

- ```dart
    child: ListTile(
      leading: Icon(
        Icons.phone,
        color: Colors.pink,
      ),
      title: Text(
        '+82 7601 2577',
        style: TextStyle(
          color: Colors.pink.shade900,
          fontFamily: 'SourceSansPro',
          fontSize: 20.0,
        ),
      )
    ),
    ```

- sizedBox를 이용할 때 divider class를 사용할 수 있다. 양쪽에 padding을 갖는 가는 선이며, listTile 사이에 구분선을 만들 때 최적화되어있다.

- ```dart
    SizedBox(
      height: 20.0,
      width: 150.0,
      child: Divider(
        color: Colors.white,
      ),
    ),
    ```

- width를 조종해 길이를 바꿀 수 있으며 색상 조정이 가능하다.

