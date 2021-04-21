package com.flo.alwaysbom.community.review.dao;

import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.vo.ReviewLikeVo;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
import com.flo.alwaysbom.fclass.vo.OclassVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ReviewDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    /* (R) 모든 리뷰 조회 (시간순 내림차순) */
    public List<ReviewVo> findAll() {
        return sqlSessionTemplate.selectList("REVIEW.findAll");
    }

    /* (R) 전체 베스트 20 리뷰 보기 (좋아요순 내림차순 정렬) */
    public List<ReviewVo> findBestReviewFromAll() {
        return sqlSessionTemplate.selectList("REVIEW.findBestReviewFromAll");
    }

    /* (R) 카테고리별 베스트 10 리뷰 보기 (좋아요순 내림차순 정렬) */
    public List<ReviewVo> findBestReviewFromCategory(String category) {
        return sqlSessionTemplate.selectList("REVIEW.findBestReviewFromCategory", category);
    }

    /* (R) 카테고리별 리뷰 보기 (시간순 내림차순) */
    public List<ReviewVo> findByCategory(String category) {
        return sqlSessionTemplate.selectList("REVIEW.findByCategory", category);
    }

    /* (R) 특정 카테고리의 특정 idx 값에 해당하는 리뷰만 보기 (시간순 내림차순) */
    public List<ReviewVo> findByCategoryAndIdx(Map<String, String> map) {
        return sqlSessionTemplate.selectList("REVIEW.findByCategoryAndIdx", map);
    }








    public List<ReviewDto> allBestReview() {
        List<ReviewDto> list = sqlSessionTemplate.selectList("REVIEW.allBestReview");
        for (ReviewDto vo: list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> allReview(String category, String tab, Integer idx) {
        List<ReviewDto> list = null;
        Map<String, Object> map = new HashMap<>();
        if(category.equals("")){
            category = null;
        }
        map.put("category", category);
        map.put("tab", category);
        map.put("idx", idx);
        if(tab.equals("best")){
            list = sqlSessionTemplate.selectList("REVIEW.cateBestReview", map);
        } else if(tab.equals("allList")) {
            list = sqlSessionTemplate.selectList("REVIEW.allReview", map);
        }
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> cateBestReview(String category) {
        if(category.equals("")){
            category = null;
        }
        List<ReviewDto> list = sqlSessionTemplate.selectList("REVIEW.cateBestReview", category);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public int oldListCnt() {
        return sqlSessionTemplate.selectOne("REVIEW.oldListCnt");
    }

    public int oldCateListCnt(String category) {
        if(category.equals("")){
            category = null;
        }
        return sqlSessionTemplate.selectOne("REVIEW.oldCateListCnt", category);
    }

    public List<ReviewDto> allCateReview(Map<String, String> searchParam) {
        List<ReviewDto> list = sqlSessionTemplate.selectList("REVIEW.allCateReview", searchParam);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> searchReview(String opt, String search) {
        List<ReviewDto> list = sqlSessionTemplate.selectList("REVIEW.searchReview", search);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public void searchReview(Integer idx, MemberVO member) {
        ReviewDto dto = sqlSessionTemplate.selectOne("REVIEW.findByIdx", idx);
        sqlSessionTemplate.delete("REVIEW.deleteReview", idx);
        sqlSessionTemplate.update("REVIEW.oitemPick", idx);
        sqlSessionTemplate.update("REVIEW.oclassPick", idx);
        if(dto.getImage() != null){
            sqlSessionTemplate.update("REVIEW.imageHas", dto.getMemberId());
        }else {
            sqlSessionTemplate.update("REVIEW.imageDontHas", dto.getMemberId());
        }
    }

    public List<ReviewLikeVo> likeList() {
        return sqlSessionTemplate.selectList("reviewLike.allLikeList");
    }

    public void likeCheck(String memberId, Integer reviewIdx) {
        List<ReviewLikeVo> list = null;
        int review=0;
        Map<String, Object> map = new HashMap<>();
        map.put("memberId", memberId);
        map.put("reviewIdx", reviewIdx);
        list = sqlSessionTemplate.selectList("reviewLike.likeSearch", map);
        if(list != null && list.size() > 0){
            sqlSessionTemplate.delete("reviewLike.likedelete" ,map);
            review = sqlSessionTemplate.selectOne("review.likeCount", reviewIdx);
            map.put("review", --review);
            sqlSessionTemplate.update("review.likeUpdate", map);
        } else{
            sqlSessionTemplate.insert("reviewLike.likeinsert", map);
            review = sqlSessionTemplate.selectOne("review.likeCount", reviewIdx);
            map.put("review", ++review);
            sqlSessionTemplate.update("review.likeUpdate", map);
        }
    }




    public List<OrdersVo> findByStatus(String id){
        return sqlSessionTemplate.selectList("orders-mapper.findId",id);
    }

    public boolean hasReviewLike(ReviewLikeVo reviewLikeVo) {
        int count = sqlSessionTemplate.selectOne("reviewLike.hasReview", reviewLikeVo);
        return count > 0;
    }


    public void addReview(ReviewDto vo, Integer idx) {
        Map<String, Integer> map = new HashMap<>();
        if(vo.getCategory().equals("꽃다발")){
           sqlSessionTemplate.insert("review.addFloIdx",vo);
        }
        else if(vo.getCategory().equals("정기구독")){
            sqlSessionTemplate.insert("review.addSubIdx", vo);
        }
        else if(vo.getCategory().equals("소품")){
            sqlSessionTemplate.insert("review.addProIdx", vo);
        }
        else if(vo.getCategory().equals("클래스")){
            sqlSessionTemplate.insert("review.addclsIdx", vo);
            map.put("idx", idx);
            map.put("reviewIdx", vo.getIdx());
            sqlSessionTemplate.update("review.classCheck", map);
            return;
        }
        map.put("idx", idx);
        map.put("reviewIdx", vo.getIdx());
        sqlSessionTemplate.update("review.reviewCheck", map);
        sqlSessionTemplate.update("review.memberPoint", vo);
    }

    public ReviewDto findByIdx(Integer reviewIdx) {
        return sqlSessionTemplate.selectOne("review.findByIdx", reviewIdx);
    }

    public void updateReview(ReviewDto vo) {
        sqlSessionTemplate.update("review.updateReview", vo);
    }

    public List<OclassVo> reviewOclass(String id, Integer checkNum) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(id + "  " + checkNum);
        map.put("id", id);
        map.put("check", checkNum);
        return sqlSessionTemplate.selectList("review.findFclass", map);
    }
}
