package com.acorn.sixman.controller;

import java.util.List;
import java.util.Map;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.sixman.common.IDGenerator;
import com.acorn.sixman.dto.BoardDTO;
import com.acorn.sixman.dto.BoardPageDTO;
import com.acorn.sixman.service.BoardServcie;

@Controller
public class BoardController {
	
	@Autowired
	BoardServcie service;
	
	@RequestMapping("/boardList")
	public String boardList(BoardPageDTO bpdto, Model model) {
		System.out.println("boardList bpdto 구경 : "+bpdto);
		List<BoardDTO> flist = service.boardList(bpdto); //게시판 공지목록
		List<BoardDTO> slist = service.boardPageList(bpdto); //게시글 목록
		bpdto.setTotalCount(service.boardCount(bpdto));
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		model.addAttribute("bpDTO", bpdto);
        return "boardMain";
    }
	
	@RequestMapping("/boardInfo")
	public String boardInfo(BoardPageDTO bpdto, Model model) {
		BoardDTO bdto = null;
		if(bpdto.getMove()!=null) { 
			bdto = service.boardMove(bpdto);
		}else {
			bdto = service.boardInfo(bpdto.getContentId());
		}
		model.addAttribute("bdto", bdto);
		
		Map<String, Object> map = service.replyList(bpdto.getContentId());
		model.addAttribute("map", map);
		
		List<BoardDTO> flist = service.boardList(bpdto); //게시판 공지목록
		List<BoardDTO> slist = service.boardPageList(bpdto); //게시글 목록
		bpdto.setTotalCount(service.boardCount(bpdto));
		bpdto.setBoardStart(service.boardStart(bpdto));
		bpdto.setBoardEnd(service.boardEnd(bpdto));
		System.out.println("boardInfo bpdto 구경 : "+bpdto);
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		model.addAttribute("bpDTO", bpdto);
        return "boardInfo";
    }
	
	@RequestMapping(value =  "/boardWrite", method = RequestMethod.GET)
    public String boardWriteUI(@RequestParam String Category, Model model) {
        System.out.println("boardWrite 이동중 : "+Category);
        model.addAttribute("Category",Category);
        return "boardWrite";
    }
	@RequestMapping(value =  "/boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardDTO dto, Model model) {
	    System.out.println("boardWrite 작성중 : "+dto);
	    IDGenerator ig = new IDGenerator();
	    String boardcontentId = ig.getNewBoardContentId();
	    System.out.println("contentid 생성중 : "+boardcontentId);
	    dto.setBoardContentId(boardcontentId);
        int n = service.boardWrite(dto);
	    return "boardList";
	}
	
	@RequestMapping(value =  "/boardReWrite", method = RequestMethod.GET)
    public String boardReWriteUI(@RequestParam String ContentId, Model model) {
        System.out.println("boardReWrite 이동중 : "+ContentId);
        BoardDTO bdto = service.boardInfo(ContentId);
        model.addAttribute("bdto",bdto);
        return "boardReWrite";
    }
	
	@RequestMapping(value =  "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam String ContentId, Model model) {
	    System.out.println("boardDelete 삭제중 : "+ContentId);
	    int n = service.boardDelete(ContentId);
	    return "boardMain";
	}
	
	@RequestMapping(value = "/boardImageUpload")
    public @ResponseBody String imageUpload(HttpServletRequest request) {
        System.out.println("이미지 업로드 중");
        String sFileInfo = "";
        try {
            
            //파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
            
            String name = request.getHeader("file-name");
            
            String ext = name.substring(name.lastIndexOf(".")+1);
            
            //파일 기본경로
            HttpSession session = request.getSession();
            String defaultPath = session.getServletContext().getRealPath("/");
            
            //파일 기본경로 _ 상세경로 (서버에 저장)
            //서버 저장위치 (업로드 이미지를 바로 읽어올수 있음)
            //10.07 현재 SpringBoot 에서의 resources 접근 방법 모름
            String path = defaultPath + "static/upload" + File.separator;
            System.out.println("path : "+path);
            //String path2 = "C://Users
    

            
            File file = new File(path);
            
            if(!file.exists()) {//해당 폴더가 없을경우 폴더 생성
            
             file.mkdirs();
            
            }
            
            String realname = UUID.randomUUID().toString() + "." + ext;
            
            InputStream is = request.getInputStream();
            
            String storedFileName = path + realname; //서버 주소 + 파일명
            //String storedFileName2 = path2 + realname; //로컬 주소 + 파일명
            
            OutputStream os=new FileOutputStream(storedFileName);
            //OutputStream os2=new FileOutputStream(storedFileName2);
            
            int numRead;
            
            //파일쓰기
            
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            
            while((numRead = is.read(b,0,b.length)) != -1){
            
             os.write(b,0,numRead);//서버에 파일 생성(서버 초기화시 war이 배포되면서 사라짐)
             //os2.write(b,0,numRead);//로컬에 파일 생성
            
            }
            
            if(is != null) {
            
             is.close();
            
            }
            
            os.flush();
            os.close();
            //os2.flush();
            //os2.close();
            
            //서버 주소 받아오기
            String root = request.getContextPath();
            
            
            //기본값
            sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL=" + root + "/static/upload/"+realname;
            
            System.out.println(sFileInfo);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return sFileInfo;
    }
}
