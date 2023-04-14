package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.FarmRepository;
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
    public List<FarmEntity> gatAllFarm() {
        return (List<FarmEntity>) farmRepository.findAll();
    }

    // 농장 상세 조회
    public FarmEntity getFarm(Long fId) {
        FarmEntity fa = farmRepository.findByFId(fId);
        return fa;
    }

    // 농장 수정
    public FarmEntity updateFarm(HttpServletRequest request, Long fId, FarmEntity farm){
        UserEntity user = userService.getUser(request);
        FarmEntity newFarm = farmRepository.findByFId(fId);

        if (Objects.equals(user.getU_id(), newFarm.getUser().getU_id())){
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
        FarmEntity farm = farmRepository.findByFId(fId);
        if(Objects.equals(user.getU_id(), farm.getUser().getU_id())){
            farmRepository.delete(farm);
        } else {
            throw new Exception();
        }
    }

}
