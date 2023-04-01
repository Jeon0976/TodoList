### 개발 과정
#### 23.03.23
- Create Cal, Todo, Project, AddTodo page)
- Create TodoList TableView)
#### 23.03.24
- Create TodoPlusView) UI & UILogic
- Modify Others page) trivial UI 
- Modify NowListView) ItemSelected시 '작업 추가' -> '작업 변경' 으로 수정
#### 23.03.27
- Create LongtermView & Cell) UI 
- Create LongtermPlusView) UI
- Next Todo:
    1. table click시 todo check 상태 변경
    2. table swipe Action(수정 삭제) 추가
    3. LongtermPlusView Detail Table View 추가
#### 23.03.28
- Create LongtermDetailTableView & Cell) UI 50%
#### 23.03.31
- Create LongtermDetailTableView 100%
- Insight: 
    1. UI를 구현하다가 그전에 생각했던 기능보다 더 좋은 기능이 생각나서 바꿀려고 했더니 모든 코드를 다시 손봐야 된다는 것을 알았다. 
    2. 그렇게 되었을 때 그전에 긴 시간동안 고민해서 만들었던 코드를 다시 처음부터 빌드해야된다고 하니 뭔가 뭐랄까 좀 아련하다. 
    3. 기존 기능은 check icon 클릭 시 check되고 table 클릭 시 todo 수정 테이블로 이동이였지만, 수정보다 check 가 클릭 빈도 및 중요도가 높을 것으로 판단되어 수정 및 삭제 버튼은 스와이프하면 나오게 수정하고 테이블 클릭 시 todo check가 되게 수정 필요성을 느낌
    4. 기존 기능 -> todo 클릭 시 todo 수정 table로 이동
        1. todo 클릭 시 todo 수정 테이블 이동시 Obserable.zip 메서드 활용하였음 
        2. Observable.zip 활용 간 table.rx.modelSelected -> Data 방출, table.rx.itemSelected -> indexPath 방출 두 메서드를 zip 하였음
        3. check는 UIButton으로 만들었음. 
    5. 변경 기능 -> todo 클릭 시 todo Check / 수정,삭제 (스와이프)
        1. table.rx.itemSelected활용 하여 todo Data isChecked로 핸들링
        3. check UIImageView로 변경
    6. **모델 데이터 선정, 데이터 View간 이동이 가장 중요한것같은 느낌이 듬.**
#### 23.04.01
- Insight: 
    1. 망했다. 모든 코드가 다 꼬인것같다. 그 흔한 쉬운 table 클릭 시 데이터 변경이 진행이 안된다. 
    2. 데이터 이동은 쉽게 구현 했지만 변경이 진행이 안 된다. 
    3. 분명 엄청 별거 아닌 것에서 막힌 기분이 드는데 돌파구가 안 보인다. 
    4. 역시 주먹구구식으로 개발하면 이렇게 큰 문제가 일어나는것같다. 
    5. 데이터형 선정, 데이터의 위치 등 사소한거 하나 하나가 나중 개발 진행 중에 큰 운석같이 느끼진다. 처음부터 개발을 진행할 때 데이터 선정 또한 쉽게 하면 안되겠다는 것을 느꼈다. 
    6. 처음부터 모든 UI, 데이터를 한 눈에 볼 수 있게 다 펼쳐보고 리팩토리링을 진행해야겠다. 
    7. 그리고 모든 기능에는 주석을 달 필요성을 느꼈다.
