package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.FarmRepository;
import com.example.farmfarm.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

@Service
public class FarmService {
    @Autowired
    private FarmRepository farmRepository;
    @Autowired
    private UserService userService;

    // 농장 등록
    public FarmEntity saveFarm(UserEntity user, FarmEntity farm){
        farm.setUser(user);
        farmRepository.save(farm);
        return farm;
    }

    // 농장 조회 (전체 리스트 조회)
    public List<FarmEntity> getAllFarm() {
        return (List) farmRepository.findAll();
    }

    // 농장 상세 조회
    public FarmEntity getFarm(Long fId) {
        FarmEntity fa = farmRepository.findByfId(fId);
        return fa;
    }

    //나의 농장 조회
    public  FarmEntity getMyFarm(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
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
            newFarm.set_auction(farm.is_auction()); // 이게 왜 이런걸까요 ?
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
            throw new Exception();
        }
    }
}
