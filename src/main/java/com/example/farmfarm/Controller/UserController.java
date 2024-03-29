package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.ReviewEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Entity.oauth.OauthToken;
import com.example.farmfarm.Repository.UserRepository;
import com.example.farmfarm.Service.FarmService;
import com.example.farmfarm.Service.UserService;
import com.example.farmfarm.Config.jwt.JwtProperties;
import org.h2.engine.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"Authorization", "user", "myFarm"})
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService; //(1)만들어둔 UserRepository 를 @Autowired 해준다.
    @Autowired
    private FarmService farmService;

    @Value("${KakaoAuthUrl}")
    private String KakaoAuthUrl;

    @Value("${KakaoApiKey}")
    private String KakaoApiKey;

    @Value("${RedirectURI}")
    private String RedirectURI;

    @Value("${KakaoApiUrl}")
    private String KakaoApiUrl;

    @Value("${serverUrl}")
    private String serverUrl;
    @Autowired
    private UserRepository userRepository;

    @ResponseBody
    @GetMapping(value = "/login/getKakaoAuthUrl")
    public String getKakaoAuthUrl(HttpServletRequest request){
        String reqUrl = KakaoAuthUrl + "/oauth/authorize?client_id=" + KakaoApiKey + "&redirect_uri="+ RedirectURI + "&response_type=code";
        System.out.println(reqUrl);
        return reqUrl;
    }

    // 프론트에서 인가코드 받아오는 url
    @GetMapping("/login/oauth_kakao")
    public String getLogin(RedirectAttributes attr, @RequestParam("code") String code, Model model, HttpSession session) {
        System.out.println("code : " + code);
        // 넘어온 인가 코드를 통해 access_token 발급
        OauthToken oauthToken= userService.getAccessToken(code);
        System.out.println("oauthToken : " + oauthToken);
        // 발급 받은 accessToken 으로 카카오 회원 정보 DB 저장 후 JWT 를 생성
        //UserService 의 기존 SaveUser 메소드를 수정한다
        String jwtToken = userService.saveUserAndGetToken(oauthToken.getAccess_token());
        //응답 헤더의 Authorization 이라는 항목에 JWT 를 넣어준다.
        HttpHeaders headers = new HttpHeaders();
        headers.add(JwtProperties.HEADER_STRING, JwtProperties.TOKEN_PREFIX + jwtToken);
        String Auth = JwtProperties.TOKEN_PREFIX + jwtToken;
        System.out.println("our Token : " + jwtToken);
        //JWT 가 담긴 헤더와 200 ok 스테이터스 값, "success" 라는 바디값을 ResponseEntity 에 담아 프론트 측에 전달한다.
        //System.out.println(ResponseEntity.ok().headers(headers).body(null));
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity req = new HttpEntity(headers);
        ResponseEntity<UserEntity> response = restTemplate.exchange(
                serverUrl + "/user/me",
                HttpMethod.GET,
                req,
                UserEntity.class
        );
        //request.setAttribute("Authorization", headers.get("Authorization"));
        attr.addFlashAttribute("Authorization", headers.get("Authorization"));

        System.out.println("kakaoLoginNickname1 : " + response.getBody().toString());
        System.out.println("kakaoLoginNickname2 : " + response.getBody().getNickname());
        model.addAttribute("Authorization", Auth);
        model.addAttribute("user", response.getBody());
        model.addAttribute("myFarm", farmService.getMyFarm(response.getBody()));
        session.setAttribute("uid", response.getBody().getUId());
        if (response.getBody().getNickname() == null) {
            return "redirect:/user/nickname";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("/me")
    public ResponseEntity<Object> getCurrentUser(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
        return ResponseEntity.ok().body(user);
    }

    @DeleteMapping("/")
    public ResponseEntity<Object> deleteUser(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
        UserEntity newUser = userService.deleteUser(user);
        return ResponseEntity.ok().body(newUser);
    }

    @GetMapping("/nickname")
    public String getNicknameForm(Model model, @ModelAttribute("Authorization") String Auth) {
        model.addAttribute("Authorization", Auth);

        return "myPage/createNickname";
    }

    @GetMapping("/nickname/create")
    public String setNickname(HttpServletRequest request, @RequestParam String nickname, Model model) {
        //UserEntity user = (UserEntity)session.getAttribute("user");
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!" + nickname);
        UserEntity newUser = userService.setNickname(userService.getUser(request), request.getParameter("nickname"));
        model.addAttribute("user", newUser);
        return "redirect:/";
    }

    @GetMapping("/profile")
    public String updateProfileForm() {
        return "myPage/editMyPage";
    }

    @PostMapping("/profile")
    public ResponseEntity<Object> updateProfile(@RequestBody UserEntity updateUser, HttpSession session, Model model) {
        System.out.println("updateUser1" + updateUser.getImage());
        System.out.println("updateUser2" + updateUser.getNickname());
        UserEntity user = (UserEntity)session.getAttribute("user");
        UserEntity getUser = userService.findById(user.getId());
        getUser.setNickname(updateUser.getNickname());
        getUser.setImage(updateUser.getImage());
        UserEntity saveUser = userRepository.save(getUser);
        model.addAttribute("user", saveUser);
        return ResponseEntity.ok().body(saveUser);
    }

    @GetMapping("logout")
    public String logout(SessionStatus session) {
        session.setComplete();
        return "redirect:/index";
    }
}
