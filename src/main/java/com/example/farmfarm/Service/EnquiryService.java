package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.EnquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Service
public class EnquiryService {
    @Autowired
    EnquiryRepository enquiryRepository;
    @Autowired
    UserService userService;

    public EnquiryEntity saveEnquiry(UserEntity user, ProductEntity product, EnquiryEntity enquiry) {
        enquiry.setUser(user);
        enquiry.setProduct(product);
        //enquiryRepository.save(enquiry);
        return enquiry;
    }

    public EnquiryEntity updateEnquiry(HttpServletRequest request, Long eId, EnquiryEntity enquiry) {
        UserEntity user = userService.getUser(request);

        EnquiryEntity en = enquiryRepository.findByeId(eId);
        if (Objects.equals(user.getUId(), en.getUser().getUId())) {
            en.setContent(enquiry.getContent());
            en.setIs_secret(enquiry.getIs_secret());
            enquiryRepository.save(en);
            return en;
        }
        else
            return null;
    }
    public void deleteEnquiry(HttpServletRequest request, Long eId) throws Exception{
        UserEntity user = userService.getUser(request);
        EnquiryEntity en = enquiryRepository.findByeId(eId);
        if (Objects.equals(user.getUId(), en.getUser().getUId())) {
            enquiryRepository.delete(en);
        } else {
            throw new Exception();
        }
    }
}
