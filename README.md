# 묵찌빠 READ ME

### 1. 프로그램 명: 묵찌빠 게임

### 2. 소개
- 묵찌빠 게임을 swift로 구현하였습니다.
- 짝 프로그래밍을 통해 돌아가며 커밋하고, 의견을 나누며 협업하였습니다.

### 3. 팀원
<img src="https://avatars.githubusercontent.com/u/66786418?s=400&u=dfb76ec552563eb8eb6dd31fc817596f62ccb665&v=4" width=200>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|:--:|
|토털이|태리|




### 4. 타임 라인:
- 월 : STEP 1 가위바위보 게임 구현
    - 가위바위보 메뉴 출력 함수
    - 유저 번호 입력 함수
    - 유저 손과 컴퓨터 손 비교 함수
- 화 : STEP 1 가위바위보 게임 수정
    - 유저 번호 입력 함수와 검증 함수로 기능 분리
    - compareHands()의 로직을 공식문서를 기준으로 수정 :+1: 
- 수 : 
    - 묵찌빠 메뉴 출력 함수 
    - 묵찌빠 함수 구현
    - 묵찌빠 손 비교 함수 구현
    - 손 타입 set 함수 구현
    - 파일 분리
- 목 : 
    - 가위바위보 메뉴 출력함수와 묵찌빠 메뉴 출력함수 이름 수정
    - foundation 제거
    - 묵찌빠, 가위바위보 관련 줄임말 수정
    - 게임 종료 로직과 validation 로직을 분리
- 금 : 
    - 가위바위보와 묵찌빠에 따른 handtype 지정 함수를 따로 분리하여 수정

### 5. 순서도
<details>
<summary>STEP-1</summary>
<div markdown="1">       
  <img src="https://i.imgur.com/JsP6G1N.png">
</div>
</details>

<details>
<summary>STEP-2</summary>
<div markdown="1">       
  <img src="https://i.imgur.com/mc4hnxI.png">
</div>
</details>

### 6. 함수 설명
- `startGame()` : 가위바위보 게임을 시작하는 함수
    - `printRockScissorPaperMenu()` : 가위바위보 메뉴를 출력하는 함수
    - `userInput()` : user input을 get하는 함수
    - `validateUserInputNumber(input:)` : 0과 3사이의 값이 아닐때, user input을 Bool형태로 검증해주는 함수 
    -  `makeStringToInt` : String 타입의 input값을 Int로 변환해주는 함수
    -  `setHandTypeForRockScissorPaper(userHandnumber:Int)` : 유저 손 타입과 컴퓨터 손 타입을 지정해주는 함수
    -  `compareHandsForRockScissorPaper(hands:)` : 유저 손 타입과 컴퓨터 손 타입을 비교해주고 결과를 출력해주는 함수. 비길 시 game을 재귀하여 재 실행하고, 이기거나 질 경우 playMukZipa를 지정된 턴과 함께 실행함.
- `playMukZiPa(turn:)` : 사용자 혹은 컴퓨터의 턴에 따라 묵찌빠 게임을 실행하는 함수
    - `printMukZiPaMenu` : 묵찌빠 메뉴를 출력하는 함수
    - `userInput()` : user input을 get하는 함수
    - `validateUserInputNumber(input:)` : 0과 3사이의 값이 아닐때, user input을 Bool형태로 검증해주는 함수 
    -  `makeStringToInt` : String 타입의 input값을 Int로 변환해주는 함수
    -  `setHandTypeForMukZiPa(userHandnumber:Int)` : 묵찌빠 순서에 따른 유저 손 타입과 컴퓨터 손 타입을 지정해주는 함수
    -  `compareHandsForMukZiPa(hands:)` : 유저 손 타입과 컴퓨터 손 타입을 비교해주고 결과를 출력해주는 함수. 비길 시 현재 턴의 플레이어가 승리함을 프린트함. 이기거나 질 경우 playMukZipa를 지정된 턴과 함께 실행하여 누군가가 묵찌빠에서 승리할때까지 재귀함.

### 7. 트러블 슈팅
- **switch 문 활용**: 저희가 공식 문서를 읽던 중 새로운 방법으로 분기를 할 수 있게 되었습니다. 변경된 로직은 다음과 같습니다
이전에는 공식문서를 읽기 전이어서, 모든 userHand와 computerHand의 경우의 수를 switch내의 if문으로 처리해주려고 했는데, 공식 문서를 읽은 후 깨달음을 얻어 다른 로직으로 작성할 수 있었습니다.
    - 이전에 생각했던 로직
    ```swift
    if userHand == computerHand {
            print("비겼습니다!")
            playRockScissorPaper()
            return
        }
        switch userHand {
        case .scissor:
            if computerHand == .rock {
                print("졌습니다!")
            } else {
                print("이겼습니다!")
            }
        case .rock:
            if computerHand == .paper {
                print("졌습니다!")
            } else {
                print("이겼습니다!")
            }
        case .paper:
            if computerHand == .scissor {
                print("졌습니다!")
            } else {
                print("이겼습니다!")
            }
        }
    ```
    - 공식 문서를 읽은 후 수정한 로직
    ```swift
    let hands = (userHand, computerHand)
    switch hands {
    case let (user, computer) where user == computer:
        print("비겼습니다!")
        playRockScissorPaper()
    case (.scissor, .paper), (.paper, .rock), (.rock, .scissor) :
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
    ```
- **함수 기능 분리**
하나의 함수에서 입력, 검증, 타입변환을 모두 수행하였는데 네이밍과 함수 내부에서 수행하는 작업이 일치하지 않다는 생각을 하게 되어서 3가지 기능을 모두 다른함수로 분리하였다.
getUserNumberWithValidation() -> userInput(), validateUserInputNumber(), makeStringToInt()로 분리

### 8. 배운점
- 네이밍:
    - set, get: get의 경우 생략해주는 것이 좋고, set의 경우에는 fetch, request, perform을 사용해주는 것이 좋지만 왕도는 아니다.
    - 줄임말: 줄임말은 사용을 자제하고, 최대한 설명을 해주는 편이 읽는 사람에게 편하다.
    - 명확한 기능에 따른 네이밍: 두가지 기능을하는데 한가지 기능만 설명되어 있는 함수 등은 지양하는 것이 좋고, 하나의 함수에 하나의 기능만 넣는 편이 좋다.
- switch문의 활용: 
    - 단순히 값을 switch하는 것을 넘어서 값을 할당(let)하여 where로 비교해줄 수 있다는 점을 공식문서를 읽으며 추가적으로 배웠다. switch가 복잡한 분기에서 if보다 효율적인 사용이 될 수 있다는 것을 배울 수 있었다. 
- 공식문서의 중요성:
    - 안다고 자만하지 않고, 천천히 공식문서를 읽어보면서 놓쳤던 부분을 짚어보며 새로운 코드들을 작성해 볼 수 있었다.
