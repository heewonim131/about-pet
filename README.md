# 🐶 어바웃펫-JSP/Servlet
>### 반려동물 생활 플랫폼 어바웃펫 클론 코딩  
>JSP/Servlet을 활용하여 MVC 패턴으로 구현한 프로젝트

</br>

## 1. 제작 기간 & 참여 인원
- 2021.05.26 ~ 2021.07.23
- 5인 팀 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - JDBC (ojdbc6)
  - Oracle 11g

</br>

## 3. 담당 역할
|팀원|역할|
|:--|:--|
|임희원|회원 서비스|
|A(팀장)|펫TV, 펫스쿨 영상 서비스|
|B|펫로그 SNS 서비스|
|C, D|펫스토어 주문결제 서비스|

</br>

## 4. 구현 기능
구현 기능은 회원가입, 로그인, 마이페이지 입니다.

### 4.1. 전체 흐름
![image](https://user-images.githubusercontent.com/92259017/159844151-9755ba4c-3058-4f1a-b808-49958a2220a6.png)
  
### 4.2. 사용자 요청
![image](https://user-images.githubusercontent.com/92259017/159844196-6b660383-8758-4458-922e-285627fb268b.png)
  
- **회원가입 요청** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-jsp/blob/d93040a9bb9486e90a175563f199abec047dfa21/WebContent/Project/aboutPet/join1.jsp#L714)
  - 회원가입에 필요한 정보들을 담아 POST 타입으로 요청합니다.

### 4.3. Controller
![image](https://user-images.githubusercontent.com/92259017/159844366-1719e4b0-4eb0-4e3f-b18a-449f2955e361.png)
  
- **회원가입 요청 처리** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-jsp/blob/d93040a9bb9486e90a175563f199abec047dfa21/src/project/aboutPet/mypage/command/SignUpHandler.java#L15)
  - 회원가입 요청을 처리하고 결과를 화면단에 응답합니다.
  
### 4.4. Service
![image](https://user-images.githubusercontent.com/92259017/159844601-7b304b8f-0381-4be7-8215-34174df95093.png)

- **회원가입 수행** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-jsp/blob/d93040a9bb9486e90a175563f199abec047dfa21/src/project/aboutPet/mypage/service/SignUpService.java#L22)
  - 전달받은 회원 정보로 회원가입을 수행합니다.
  
### 4.5. DAO
![image](https://user-images.githubusercontent.com/92259017/159845144-5d1cfb49-ed05-49b1-846d-7ba03a8a13f9.png)

- **회원 데이터 저장** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-jsp/blob/d93040a9bb9486e90a175563f199abec047dfa21/src/project/aboutPet/mypage/dao/MyPageDAO.java#L35)
  - 회원 데이터를 DB에 저장합니다.

</br>
