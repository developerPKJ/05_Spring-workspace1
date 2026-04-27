package com.kh.web; // 패키지 선언부

// import 선언부
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*
 * * Spring 프로젝트의 main 메소드
 * 
 * - Spring 을 이용해서 만든 프로젝트의 시작점 (entry point) 를 나타냄
 * - 즉, 프로그램 구동 시 제일 먼저 실행되는 메소드
 * - 우리 웹사이트의 메인화면을 제일 먼저 띄워줌
 * 
 * * 메인화면 (메인페이지) 만들기
 * 
 * - src/main 폴더 내부에 만들 예정!!
 *   java 폴더 : 기존의 src 폴더 역할 (패키지, 자바 클래스 작업)
 *   resources 폴더 : 외부 프레임워크 연동 설정 파일 등을 담는 소스폴더
 *   +
 *   webapp 폴더 : 나중에 배포되는 폴더 (즉, 웹사이트 구동 시 필요한 모든 파일이 포함되어야함)
 *   			  이 폴더 내부 어딘가에 메인화면을 나타내는 파일을 둘 것!!
 * 
 * - src/main/webapp/WEB-INF/views : 앞으로 화면과 관련된 파일들은 모두 보관해둘것!!
 * 
 * - 메인페이지를 나타내는 파일 : index.jsp 파일로 만들어야 한다!! (규칙)
 *   (단, pom.xml 파일에 jsp 를 사용하기 위한 라이브러리 .jar 를 추가해야함)
 */

@SpringBootApplication // Annotation (어노테이션)
public class Application { // 클래스 선언부

	// main 메소드
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		
		System.out.println("잘 실행되나..?");
	}

}
