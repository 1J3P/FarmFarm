package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.EnquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class EnquiryService {
    @Autowired
    EnquiryRepository enquiryRepository;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;

    //문의사항 작성
    public EnquiryEntity saveEnquiry(UserEntity user, ProductEntity product, EnquiryEntity enquiry) {
        enquiry.setUser(user);
        enquiry.setProduct(product);
        return enquiryRepository.save(enquiry);
    }

    //문의사항 수정
    public EnquiryEntity updateEnquiry(HttpServletRequest request, Long eId, EnquiryEntity enquiry) {
        UserEntity user = userService.getUser(request);
        EnquiryEntity newEnquiry = enquiryRepository.findByeId(eId);
        System.out.print(newEnquiry);
        if (Objects.equals(user.getUId(), newEnquiry.getUser().getUId())) {
            newEnquiry.setContent(enquiry.getContent());
            newEnquiry.setIs_secret(enquiry.getIs_secret());
            newEnquiry.setCreated_at(enquiry.getCreated_at());
            enquiryRepository.save(newEnquiry);
            return newEnquiry;
        }
        else
            return null;
    }

    //문의사항 삭제
    public void deleteEnquiry(HttpServletRequest request, Long eId) throws Exception{
        UserEntity user = userService.getUser(request);
        EnquiryEntity en = enquiryRepository.findByeId(eId);
        if (Objects.equals(user.getUId(), en.getUser().getUId())) {
            enquiryRepository.delete(en);
        } else {
            throw new Exception();
        }
    }

    //상품별 문의사항 가져오기
    public List<EnquiryEntity> getProductEnquiry(Long pId) {
        ProductEntity product = productService.getProduct(pId);
        return enquiryRepository.findByProduct(product);
    }

    //나의 문의사항 가져오기
    public List<EnquiryEntity> getMyEnquiry(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
        return enquiryRepository.findByUser(user);
    }
}
