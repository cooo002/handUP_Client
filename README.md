
# 2020 창업 동아리
# 현직자 매칭 서비스
대학생이 진로를 결정할 때 궁금한 것은 많은데 기존 서비스들을 취업을 위한 정보제공에 포커스를 맞추고 있다. 꼭 취업 관련 질문이 아닌
해당 직무에 대한 사소한 질문에 현직자들이 답변해주고 질문자와 현직자가 만날 수 있게 도와주는 서비스를 만들고자 이번 프로젝트를 기획하게 되었다.

## 1. 프로젝트 개요
- 프로젝트 유형 : 2020 벤쳐창업 동아리
- 프로젝트 수행기간 : 2020.07.10. ~ 2019.11.13

## 2. 프로젝트 기획배경 및 목표
ㄱ. 프로젝트 기획배경

![](https://images.velog.io/images/cooo002/post/ac441935-9616-4de2-9be2-e946d60b5543/image.png)

- REST API, AWS Cloud Computer를 활용한 현직자 매칭 기반 지식 공유 서비스
- Naver Mobile Map API Ver 2.0를 활용한 질문자와 현직자 위치 기반 매칭 기능 제공


ㄴ. 프로젝트 목표
 - Figma를 활용한 서비스 와이어프레임 제작
 - REST API 등을 활용한 서비스 개발
 - Alamorfire를 이용한 서버와의 통신 
 - 비동기 프로그래밍 방식, 캐싱기법 등을 이용한 UI/UX 최적화 기법
 - 데이터 직렬화를 이용한 간단한 데이터 처리
 
## 3. 프로젝트 수행내용
ㄱ. 개발환경

### * 클라이언트

![](https://images.velog.io/images/cooo002/post/6b462afb-051d-4670-aab0-0989df9c30f3/image.png)


클라이언트 앱 개발환경은 그림과 같이 구성하여 개발을 진행하였음. 프로젝트 간 협업 도구로 Notion을 사용하고, UI 디자인을 위하여 Figma를 사용하였음.

![](https://images.velog.io/images/cooo002/post/e170cb6c-cde4-4215-8a11-6ed7e7e5dffa/image.png)


또한 위와 같은 실제 개발 작업은 iOS 애플리케이션 서비스를 구현하기 위해 xCode에서 swift를 활용하여 개발을 진행하였음.

### * 서버

![](https://images.velog.io/images/cooo002/post/964684d2-556f-4e08-93cb-5a3a15ffe0e8/image.png)

로컬 컴퓨터에서 개발을 마친 뒤 Git을 이용하여 원격 저장소로 개발 결과를 저장하였으며, 이를 배포 자동화 프로그램을 이용하여 테스트한 뒤 AWS Codedeploy를 이용하여 로컬 컴퓨터와 동일하게 구축한 클라우드 컴퓨터를 통해 프로그램을 실행시키고 이를 외부 개발자와 사용자가 접근하도록 구현하였음.


ㄴ. 프로젝트 참여인원 및 담당업무

> ### 김재석(*본인)
* **프로젝트 활용기술**
REST API, Swift, Firebase, Cashing, git, cocoaPods, xCode, Authentication, Google Trend Service, Hash Tag LAB, Figma,Auth, Json, GCD, DispatchQueue
* **담당업무**
-Figma를 활용한 와이어프레임 제작
-Swift, Xcode, ios를 활용한 앱 제작 
-UI/UX 최적화

> ### 류원혁
* **프로젝트 활용기술**
AWS, OAuth, Http,
Java, SpringBoot, Database, Json, Postman
* **담당업무**
-AWS를 활용한 서버구축



ㄷ. 세부수행 내역(담당업무)

### * Figma를 활용한 와이어프레임 제작

![](https://images.velog.io/images/cooo002/post/115cfe3f-fba8-4e5f-a2dc-c48699b25421/image.png)

>  * **Figma를 활용하여 와이어프레임을 제작한 이유**
 -효율적인 개발
 -앱 시나리오의 시각화효과
 -디자이너들과의 소통을 위한 연습


### * Git Kraken을 활용한 버전관리

![](https://images.velog.io/images/cooo002/post/698b9d03-81ab-451f-93c5-047405ca732a/image.png)

> * **버전관리에 GitKraken을 활용한 이유**
-효율적인 개발
-버전관리의 시각화효과
-GUI환경에서의 git사용에 대한 궁금증
  
  
  
  
### * Swift, Xcode, ios를 활용한 앱 제작


![](https://images.velog.io/images/cooo002/post/1260c6f6-0da9-4c93-82fa-0235c1ca8a99/image.png)

![](https://images.velog.io/images/cooo002/post/8d52d4a7-30d5-40a6-8074-a22c52e33095/image.png)


> * **ios 앱 개발 과정에서 중시했던 점**
 -DistpatchQueue를 활용한 비동기 프로그래밍 방식의 개발
 -Alamofire를 활용한 서버와의 통신 구현
 -AutoLayout을 활용한 각 기종 별 대응성 확대
 
 
>  * **비동기프로그래밍 방식 적용의 이유**
 -서버와의 통신 과저에서의 앱이 멈추는 것과 같은 현상 처리
 -한정된 자원의 효울적인 활용
 -사용자 경험의 최적화를 고려한 개발

  
### * DispatchQueue, 캐싱기법, 데이터 직렬화 기법등을 활용한 UI/UX 최적화

![](https://images.velog.io/images/cooo002/post/195af194-8c15-4eab-87a4-3e5b048c01b5/image.png)

> * **캐싱기법의 활용이유**
 -재사용되는 자원의 관리
 -최적화된 사용자 경험을 고려한 개발
 -메인 쓰레드가 수행해야 할 작업 경량화
  
> * **데이터 직렬화 기법의 활용**
 -NSUserDefaults를 활용한 간단한 데이터 저장
 -서버접근의 최소화
 -메인 쓰레드가 수행해야 할 작업 경량화
 
  
> * **DispatchQueue의 활용 이유**
 -쓰레드 접근의 간편성
 -서버와의 통신 과저에서의 앱이 멈추는 것과 같은 현상 처리
 -한정된 자원의 효울적인 활용
 -사용자 경험의 최적화를 고려한 개발
 -비동기 프로그래밍 방식의 적용

ㄹ. 구동화면 및 세부설명

### * 초기화면 및 로그인 기능

![](https://images.velog.io/images/cooo002/post/f97d7694-0f82-4ada-8e23-0ab16c8fbc5a/image.png)

> 
* 런쳐 스크린 구현
* 3rd-Party Library를 이용한 간편 인증 기능 구현
* UICollectionVicontroller, AutoLayout 등을 이용한 메인화면 구현

### * 질문하기 기능

![](https://images.velog.io/images/cooo002/post/65818bc2-9758-4cd4-bac7-b2a20fe5e0a1/image.png)

> 
* SDWebImage를 활용하여 해당 화면 내 이미지에 캐싱기법 적용
* UICollectionVicontroller, AutoLayout 등을 이용한 UI 구현
* Alamofire를 이용한 서버와의 통신 기능 구현
* Text양에 따른 UIView의 높이 동적 구현

### * 답변하기 기능

![](https://images.velog.io/images/cooo002/post/9839b536-f17c-437a-a4ae-9be3722df0be/image.png)

> 
* UICollectionVicontroller, AutoLayout 등을 이용한 UI 구현
* Alamofire를 이용한 서버와의 통신 기능 구현
* CustomTabBar 구현
* NotificationCenter를 활용한 키보드에 의한 TextField가리는 현상 해결


### * 현직자 매칭 기능

![](https://images.velog.io/images/cooo002/post/49b5049d-d927-4500-9f54-221d0d165f7f/image.png)

> 
* UICollectionViewController를 이용한 추천코스 상세보기 UI 구현
* Naver Mobile Map API Ver 1.0와 GPS를 활용한 주변 현직자 보기 기능구현
* Alamofire를 이용한 서버와의 통신 기능 구현
* SDWebImage를 활용하여 해당 화면 내 이미지에 캐싱기법 적용
* 사내 이메일, 재직 증명서를 활용한 현직자 인증 기능 구현
* Text양에 따른 UIView의 높이 동적 구현


