# 오늘의 소식 프로그램
오늘 하루 있었던 일들을 사진과 글로 포스팅해서 사람들과 댓글로 소통하는 프로그램입니다. <br><br><br>


## 홍유리 개인 정보
- Blog : https://dbfl720.tistory.com
- Youtube : www.youtube.com/@YURIHONG-uh8py
- Email : dbfl720@gmail.com
<br><br><br>

## Description
  -  Back-End  :     JAVA ,     SpringBoot,     JSP,    JST  <br>    
  -  DB  :  MySQL, MyBatis, JPA <br>  
  -  Front-End   :    JQuery,      JavaScript ,    CSS,      HTML,     BOOTSTRAP <br>
  -  TOOLS :     Eclips,  SpringToolSuit4,   SourceTree,   Visual Studio Code <br><br><br> <br><br>




  
#  🌳 에러 코드

Stacktrace:] with root cause

**java.lang.NumberFormatException: For input string: "comment"**

at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)

 


Thu Apr 20 18:39:20 KST 2023

There was an unexpected error (type=Internal Server Error, status=500).

For input string: "comment"

java.lang.NumberFormatException: For input string: "comment" at java.base/java.lang.NumberFormatException.forInputString(NumberFormatExcep


 <br><br>
 
 
* 🌾 원인 : List를 jsp에서 뿌릴 때 items 명 잘못 구성.

* 🌾 해결 방법 : List는 jsp 뿌릴 때 items명을 2중 구조로 쓴 후 필드명 쓰기. 
 


 <br><br>
**<전>** <br>

<img width="1144" alt="스크린샷 2023-04-20 오후 6 40 54" src="https://user-images.githubusercontent.com/116433637/233334659-ad3e29d5-d099-4c5f-9df1-39ee8fbae342.png">




 <br><br>

**<후>** <br>
<img width="1078" alt="스크린샷 2023-04-20 오후 6 56 58" src="https://user-images.githubusercontent.com/116433637/233334670-18cab328-3ccd-40f4-a428-d67ae65893f2.png">


 

 <br>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



































#  🌳 에러 코드

500에러

**org.springframework.web.multipart.MultipartException: Current request is not a multipart request**

at org.springframework.web.method.annotation.RequestParamMethodArgumentResolver.handleMissingValueInternal(RequestParamMethodArgumentResolver.java:210)

at org.springframework.web.method.annotation.RequestParamMethodArgumentResolver.handleMissingValue(RequestParamMethodArgumentResolver.java:193)

at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:114)

at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:122)
 


 <br><br>
 
 
* 🌾 원인 : date 오타.

* 🌾 해결 방법 :  date -> data로 변경.
 


 <br><br>
**<전>** <br>


![스크린샷 2023-04-18 오후 3 28 01](https://user-images.githubusercontent.com/116433637/232691942-dcfe99ae-a4a3-4b57-8870-e682de43b2a2.png)


 <br><br>

**<후>** <br>

![스크린샷 2023-04-18 오후 3 29 35](https://user-images.githubusercontent.com/116433637/232691966-910fbc10-76bf-428b-ad72-d90b35315d5e.png)



 <br>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


























#  🌳 에러 코드

2023-04-15 00:48:00,501 DEBUG [org.springframework.web.servlet.DispatcherServlet] Completed **405** METHOD_NOT_ALLOWED

2023-04-15 00:48:00,501 DEBUG [org.springframework.web.servlet.DispatcherServlet] **"ERROR" dispatch for POST "/error", parameters={}**

2023-04-15 00:48:00,502 DEBUG [org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping] Mapped to org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController#error(HttpServletRequest)


2023-04-15 00:48:03,660 DEBUG [org.springframework.web.servlet.DispatcherServlet] GET "/static/css/style.css", parameters={}

2023-04-15 00:48:03,661 DEBUG [org.springframework.web.servlet.handler.SimpleUrlHandlerMapping] Mapped to ResourceHttpRequestHandler [classpath [META-INF/resources/], classpath [resources/], classpath [static/], classpath [public/], ServletContext [/]] 

2023-04-15 00:48:03,663 DEBUG [org.springframework.web.servlet.DispatcherServlet] Completed 200 OK

 


 <br><br>
 
 
* 🌾 원인 : AJAX + form 태그 활용부분 - 버튼을 클릭하면 작동하는 함수에  this를 써서 속성을 변수에 정하려고 했다.

* 🌾 해결 방법 : 버튼을 클릭하면 작동하는 함수이기에, this를 쓰면 버튼이 작동되는 것이므로, form태그 아이디로 바꿔줘서 속성을 변수에 작동하게 해야 한다. 
 


 <br><br>
**<전>** <br>
![스크린샷 2023-04-15 오전 12 58 26](https://user-images.githubusercontent.com/116433637/232098397-6ba22978-e286-4dce-a949-65ae9d961cd5.png)
![스크린샷 2023-04-15 오전 12 54 35](https://user-images.githubusercontent.com/116433637/232098409-86974c14-49a2-480e-9a68-327a04f51a1e.png)




 <br><br>

**<후>** <br>
![스크린샷 2023-04-15 오전 1 03 22](https://user-images.githubusercontent.com/116433637/232098420-2674cb5a-3cad-46f4-b9c3-5b9b53cdd8b2.png)



 <br>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>














#  🌳 에러 코드
2023-04-14 15:58:04,738 ERROR [org.apache.catalina.core.ContainerBase.[Tomcat].[localhost].[/].[dispatcherServlet]] Servlet.service() for servlet [dispatcherServlet] in context with path [] threw exception [Request processing failed: org.mybatis.spring.MyBatisSystemException] with root cause

<b>org.apache.ibatis.exceptions.TooManyResultsException:</b> Expected one result (or null) to be returned by selectOne(), but found: 2
java.lang.**ClassNotFoundException**: org.apache.jsp.WEB_002dINF.jsp.lesson06.booking_005finsert_005flayout_j


 <br><br>
 
 

* 🌾 원인 : DB에 중복된 아이디

* 🌾 해결 방법 :  DB 중복된 아이디 삭제.

 


 <br><br>


<img width="878" alt="스크린샷 2023-04-14 오후 6 55 17" src="https://user-images.githubusercontent.com/116433637/232097764-a58f472e-cf5f-4a16-b184-895c5eaeec17.png">




<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

