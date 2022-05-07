# 도서대여시스템 프로젝트 #
### 개발환경 ###
- JAVA
- SPRING BOOT
- HTML
- JavaScript
- jquery
- mariaDB
### 주요기능 ###
- 로그인
- 회원가입
- 책검색
- 책리스트 
- 대여
- 관심리스트 등록
### DB 테이블 ###
![image](https://user-images.githubusercontent.com/92193144/167232870-2673a17a-b062-421e-928c-a1372c9558b6.png)
##
### 참고사이트 ### 
https://library.busan.go.kr/busanlibrary/index.do
# 페이지 이용안내 #
- 사용자는 로그인 여부 없이 메인 페이지 및 책 리스트 검색등이 가능합니다.
- 원하는 책을 구경하고 그책을 대출하기 위해서 회원가입이 필요합니다.
- 사용자가 회원가입을 진행했다면 원하던 책을 대출하거나 나의 관심리스트에 추가할 수 있습니다.
- 사용자는 원하는 책이름 또는 저자명을 이용하여 책을 검색하여 책의 정보를 얻을 수 있습니다.
- 책 제목을 클릭하면 해당책의 정보를 자세히 볼 수 있는 페이지로 연결됩니다.
# 구현하면서 어려웠던 점 #
- 수업받을때는 스크롤 형식의 페이징을 배웠습니다. 하지만 제가 구현하고 싶었던 페이징은 번호를 이용한 페이징이었기 때문에
  해당 페이징을 화면에 구현하는데 많은 어려움이 있었습니다.
- 개발당시 강사님께도 제가 원하는 페이징 기법을 소개하고 여러 조언을 받았지만 제가 원하던 답은 들을 수 없었습니다.
### 해결과정 ###
- 처음에 번호 페이징이 어떻게 동작이 되는지 그 원리부터 파악하였습니다.
- 자바에서 간단하게 필요한 변수들을 구성하고 총 게시물이 몇개 이고 한 페이지에 몇개의 게시글이 나올 것인가 한 페이지의 번호가 몇개씩나올것인가
- 위 해당 정보를 공부하며 제 프로젝트에 조금씩 적용시켜 나아갔습니다.
- 처음엔 컨트롤러단에서 페이징처리를 전부 하고 view 로 넘겼었는데 개발당시 서비스에 대한 역할을 충분히 인지하지 못하였고 해당개념이 많이 부족하였습니다.
- 하지만 꾸준히 코드를 보고 서비스가 무슨역할이지? 라는 생각으로 전에 수업을 들은 코드들을 계속 복기하다보니 그때서야 해당 로직에 대한 개념이 머리속에 정리되었습니다.
- 페이징처리를 완성하고 해당 로직을 서비스에서 처리한뒤 컨트롤러에 넘겨주고 view 로 전달해줘서 성공적으로 페이징을 마무리 할 수 있었습니다.
# 완성한 페이징 처리 #
![ezgif com-gif-maker (4)](https://user-images.githubusercontent.com/92193144/167233709-b3a88bd0-b517-4fe9-aadc-7e283099d232.gif)









