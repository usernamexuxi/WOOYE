# WOOYEWEB
Open API와 추천 시스템(머신러닝)을 활용한 SpringMVC WEB

<우예 : 우리의 예술>
: 문화&예술 데이터 웹사이트
- Open API(전시회&공연 예약 및 예술가 정보)
- 회원 맞춤 명화&클래식 추천 시스템: 회원이 회원가입/취향 재설정에서 기입한 취향을 바탕으로 추천
- 커뮤니티: 글 작성/수정/삭제/검색/좋아요/신고, 댓글 작성/수정/삭제/신고
- 코인으로 OTT 구매 후 관람
- 마이페이지(회원/관리자): 내 정보 수정, 커뮤니티 글/댓글 확인, 전시회&공연 예약 취소, 코인 충전 및 보유 코인 확인, OTT 관리, 탈퇴

<br>

<폴더 소개>
- WOOYE_보고서: 우예 웹 최종 보고서
- ScreenCapture: 우예 웹 캡처 모음
- WEB: 웹 코드(백엔드/프론트엔드)
- DB: Amazon RDS~MySQL, Amazon S3
- Flask: 추천시스템 코드(파이썬)
- RecommendationSystem_Beta: 코랩에서 개발한 딥러닝 추천시스템(DB 테이블도 자체 개발)

<br>

<우예 웹 시연영상>
- 주요 기능(배속): https://user-images.githubusercontent.com/116962624/201363645-2bbd221f-cdc7-4cfa-a10b-04a4b1585404.mp4
- 회원~나의 취향(배속): https://user-images.githubusercontent.com/116962624/200557938-916fca35-f142-40e6-a133-4234acf1b0f7.mp4

<br>

<Amazon EC2 주소 및 메인 페이지 디자인>
![Amazon 우예웹 EC2 정보](https://user-images.githubusercontent.com/116962624/200503294-40f78c5e-2293-4ea8-94d9-02e4095c377d.PNG)
![우예웹_메인페이지_AWS주소](https://user-images.githubusercontent.com/116962624/200189422-905f7973-bfa0-4abc-a7a8-748fd75e8125.PNG)

<br>
  
<참고>
- WOOYE 웹 주소: http://44.193.255.186:8080 (서버 닫은 상태)
- Amazon EC2 - putty 웹 실행 (리눅스)코드: sudo /usr/local/tomcat9.0/apache-tomcat-9.0.68/bin/startup.sh)
- ppt 속 ott 영상 출처: https://www.youtube.com/shorts/1vZgpl4fBc0
