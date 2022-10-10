package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.BoardDAO;
import com.acorn.sixman.dto.BoardDTO;
import com.acorn.sixman.dto.BoardPageDTO;

@Service
public class BoardServcie {
	
	@Autowired
	BoardDAO dao;

	public List<BoardDTO> boardPageList(BoardPageDTO bpdto) {
		return dao.boardPageList(bpdto);
	}

	public List<BoardDTO> boardList(BoardPageDTO bpdto) {
		return dao.boardList(bpdto);
	}

	public int boardCount(BoardPageDTO bpdto) {
		return dao.boardCount(bpdto);
	}

	public int boardStart(BoardPageDTO bpdto) {
		return dao.boardStart(bpdto);
	}
	public int boardEnd(BoardPageDTO bpdto) {
		return dao.boardEnd(bpdto);
	}

	public BoardDTO boardMove(BoardPageDTO bpdto) {
		return dao.boardMove(bpdto);
	}

	public BoardDTO boardInfo(String ContentId) {
		return dao.boardInfo(ContentId);
	}

	public Map<String, Object> replyList(String ContentId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardDTO> list = dao.replyList(ContentId);//해당 게시물에 달린 댓글목록
		int replyCount = dao.replyCount(ContentId);//해당 게시물의 총 댓글갯수
		map.put("list", list);
		map.put("replyCount", replyCount);
		for (int i = 0; i < list.size(); i++) {//1차적으로 구한 댓글들을 참조하고 있는 댓글목록
			BoardDTO xxx = list.get(i);
			List<BoardDTO> list2 = dao.replyList(xxx.getBoardContentId());
			if(list2!=null) {map.put("list"+i, list2);}
			for (int j = 0; j < list2.size(); j++) {//2차적으로 구한 댓글들을 참고하고 있는 댓글목록
				BoardDTO yyy = list2.get(j);
				List<BoardDTO> list3 = dao.replyList(yyy.getBoardContentId());
				if(list3!=null) {map.put("list"+i+j, list3);}
			}
		}
		return map;
	}

    public int boardWrite(BoardDTO dto) {
        return dao.boardWrite(dto);
    }

    public int boardDelete(String ContentId) {
        return dao.boardDelete(ContentId);
    }

    public int increaseHitCount(String ContentId) {
        return dao.increaseHitCount(ContentId);
    }

    public int boardReWrite(BoardDTO dto) {
        return dao.boardReWrite(dto);
    }


}
