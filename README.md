# WhereIsMyHome_org
협업 프로젝트 진행

---
### 1. 공동 작업자 pc에 원격 저장소 clone
```
$git clone 원격저장소URL
```

---
### 2. 작업 환경 구성하기
```
$git init projecttest 
$cd projecttest 
$git config user.name "사용자 이름" 
$git config user.email 메일 주소
```

---
### 3.원격 저장소에 commit, push하기
```
$git remote add origin 복사한 원격저장소URL 
$vim viewtest.txt # 원하는 파일이나 폴더를 생성, 변경
$git add . 
$git commit -m "viewtest" 
$git push -u origin main
```

---
### 4. commit이 아니라면 pull
-> 반드시 작업을 하기 전에 원격 저장소의 최신 커밋을 pull로 당겨온 다음에 자신의 commit을 push하기
```
$vim viewtest.txt 
$git add viewtest.txt 
$git pull # commit 전에 pull하자!
$git commit -m "viewtest 수정"
$git push -u origin main
```

---
### 5. 새로운 브랜치로 push하기
1) git pull 명령을 사용하여 최신 수정 내역를 당겨온다
```
$git pull
```

2) 다른 기능 및 작업을 위해서 지역저장소에 새로운 브랜치를 만들고 새로운 브랜치로 이동(checkout)한다.
```
$git branch -b team1
```

3) 브랜치를 이동했다면 문서를 만든후 commit 한다.
```
$git push origin team1  #  push 후에 확인해보자
```

---
### 6. pull request로 push한 branch merge하기
원격 저장소의 파일목록에는 team1 브랜치에서 만들었던 viewtest03.txt파일이 없을것입니다.
push한 브랜치는 pull request를 통해 병합해야 원격 저장소에 반영이 되기 때문입니다.

1) branch 설명 옆에 New pull request를 클릭합니다.

2) 풀 리퀘스트에 대한 메세지를 작성 한 후 Create pull request를 누르면 협업중인 저장소에 풀 리퀘스트가 전송됩니다.

3) 협업중인 원격 저장소에 등록된 풀 리퀘스트는 공동 작업자 중 누구나 병합할수 있습니다.

저장소 파일 목록 위의 Pull request를 누르면 등록된 풀리퀘스트 목록이 나옵니다.

4) 풀 리퀘스트 메세지를 살펴본 다음 이상이 없으면 Merge pull request를 눌러 병합합니다.

필요하다면 이 공간을 통해 풀 리퀘스트를 남긴 사람과 메시지를 주고 받을수도 있습니다.

5) 커밋 메시지를 직접 입력하거나 기본메세지를 사용할수 있습니다. Confirm merge 버튼을 누르면 브랜치 병합이 마무리됩니다.

6) 브랜치가 병합되면 해당 브랜치에 있던 파일이 master 화면에 나타납니다. 브랜치 상태를 알고 싶다면 파일 목록 위에 있는 '2 branches'를 눌러주세요.

7) 브랜치가 병합된 상태라면 'merged'라고 표시되어 있습니다. 또한 어떤 협업자가 브랜치를 병합했는지도 알수 있습니다.

8) 깃허브에서 협업을 할 때는 보통 작업자 마다 브랜치를 만들어서 진행하고, 작업 중간중간 풀리퀘스트를 보내서 master 브랜치에 병합합니다. 그래서 깃허브로 협업을 할 때는 다른 작업자의 변경 내용을 바로 반영하기 위해 항상 pull을 먼저 당긴후에 자신의 작업을 진행하는 것을 권장합니다.
