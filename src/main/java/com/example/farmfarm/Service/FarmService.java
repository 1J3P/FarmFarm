package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.FarmRepository;
import com.example.farmfarm.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class FarmService {
    @Autowired
    private FarmRepository farmRepository;
    @Autowired
    private UserService userService;

    // 농장 등록
    public FarmEntity saveFarm(UserEntity user, FarmEntity farm){
        farm.setUser(user);
        return farmRepository.save(farm);
    }

    //농장 전체 조회 및 정렬 (rating: 인기순 , old: 오래된 순, new: 신규순), Default: rating
    public List<FarmEntity> getFarmsOrderBy(String criteria) {
        switch (criteria) {
            case "old":
                return farmRepository.findAll(Sort.by(Sort.Direction.ASC, "fId"));
            case "new":
                return farmRepository.findAll(Sort.by(Sort.Direction.DESC, "fId"));
            default:
                return farmRepository.findAll(Sort.by(Sort.Direction.DESC, "rating"));
        }
    }

    //농장 검색
    public List<FarmEntity> searchFarms(String keyword) {
        return farmRepository.findAllByNameContaining(keyword);
    }

    //농장 검색, 농장 정렬 같이
    public List<FarmEntity> searchSortFarms(String keyword, String criteria) {
        switch (criteria) {
            case "old":
                return farmRepository.findAllByNameContaining(keyword, Sort.by(Sort.Direction.ASC, "fId"));
            case "new":
                return farmRepository.findAllByNameContaining(keyword, Sort.by(Sort.Direction.DESC, "fId"));
            default:
                return farmRepository.findAllByNameContaining(keyword, Sort.by(Sort.Direction.DESC, "rating"));
        }
    }

    // 농장 상세 조회
    public FarmEntity getFarm(Long fId) {
        FarmEntity fa = farmRepository.findByfId(fId);
        return fa;
    }

    //나의 농장 조회
    public  FarmEntity  getMyFarm(UserEntity user) {
        FarmEntity myFarm = farmRepository.findByUser(user);
        return myFarm;
    }

    // 농장 수정
    public FarmEntity updateFarm(HttpServletRequest request, Long fId, FarmEntity farm){
        UserEntity user = userService.getUser(request);
        FarmEntity newFarm = farmRepository.findByfId(fId);

        if (Objects.equals(user.getUId(), newFarm.getUser().getUId())){
            // 수정되는 것들  (농장 이름, 위치-시, 위치-구, 상세, 이미지, 경매시간, 경매 참여 여부, 생성 시간?)
            newFarm.setName(farm.getName());
            newFarm.setLocation_city(farm.getLocation_city());
            newFarm.setLocation_gu(farm.getLocation_gu());
            newFarm.setDetail(farm.getDetail());
            newFarm.setImage(farm.getImage());
            newFarm.setAuction_time(farm.getAuction_time());
            newFarm.setAuction(farm.isAuction()); // 이게 왜 이런걸까요 ?
            newFarm.setCreated_at(farm.getCreated_at());
            newFarm.setDetail(farm.getDetail());
            farmRepository.save(newFarm);
            return newFarm;
        }
        else {
            return null;
        }
    }

    // 농장 삭제
    public void deleteFarm(HttpServletRequest request, Long fId) throws Exception{
        UserEntity user = userService.getUser(request);
        FarmEntity farm = farmRepository.findByfId(fId);
        if(Objects.equals(user.getUId(), farm.getUser().getUId())){
            farmRepository.delete(farm);
        } else {
            System.out.println("유저가 다름!!!!");
            throw new Exception();
        }
    }
}
