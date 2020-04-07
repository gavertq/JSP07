package fileDown;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Servlet implementation class FileDown
 */
@WebServlet("/FileDown")
public class FileDown extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//1.파일명 가져오기(a태그로 가져온 fileName을 Param값으로 불러와서 저장)
    	String fileName = request.getParameter("fileName");
		
		//2. 경로 가져오기
		String saveDir = super.getServletContext().getRealPath("fileUpDown");	//fileUpDown 폴더가 있는 경로를 가져와 저장
		File file = new File(saveDir+"/"+fileName);	//'경로/파일명'으로 file을 만들어서
		System.out.println("파일명 : "+fileName);	//콘솔에 파일명 출력
		
		//3. 파일 유형 가져오기
		String mimeType = getServletContext().getMimeType(file.toString());
		System.out.println("mimeType : "+mimeType);//파일의 유형을 가져온다.
		if(mimeType == null) {
			//http에서 파일 형식을 모를때 지정하는 방식이 된다.8비트 형식의 /응용프로그램 .egg, .bin 등
			response.setContentType("application/octet-stream");
			System.out.println("파일 형식을 모를때 실행 됨");
		}
		
		// 4. 다운로드용 파일명을 설정
		String downName = null;
		System.out.println("request.getHeader : "+request.getHeader("user-agent"));
		if(request.getHeader("user-agent").indexOf("Trident") == -1){//Trident : 익스플로러 값
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
			System.out.println("익스플로러 외 실행");
		}
		else{
			downName = new String(fileName.getBytes("euc-kr"), "8859_1");
			System.out.println("익스 플로러에서 실행");
		}
		
		// 5. 전송 객체에 현재 파일을 붙여서 보내겠다(content-disposition컨튼트를 처분)(attachment(부착)). 
		response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
		
		// 6. 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
		FileInputStream fileInputStream = new FileInputStream(file);	//2번 경로를 가져올때 설정한 file
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[1024];
		int data = 0;
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
			servletOutputStream.write(b, 0, data);
		
		servletOutputStream.close();
		fileInputStream.close();
		System.out.println("마지막 실행~~~");
	}
}

