package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Entity.oauth.OauthToken;
import com.example.farmfarm.Service.UserService;
import com.example.farmfarm.config.jwt.JwtProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService; //(1)만들어둔 UserRepository 를 @Autowired 해준다.

    @Value("${KakaoAuthUrl}")
    private String KakaoAuthUrl;

    @Value("${KakaoApiKey}")
    private String KakaoApiKey;

    @Value("${RedirectURI}")
    private String RedirectURI;

    @Value("${KakaoApiUrl}")
    private String KakaoApiUrl;

    @ResponseBody
    @GetMapping(value = "/login/getKakaoAuthUrl")
    public String getKakaoAuthUrl(HttpServletRequest request){
        String reqUrl = KakaoAuthUrl + "/oauth/authorize?client_id=" + KakaoApiKey + "&redirect_uri="+ RedirectURI + "&response_type=code";
        System.out.println(reqUrl);
        return reqUrl;
    }

    // 프론트에서 인가코드 받아오는 url
    @GetMapping("/login/oauth_kakao")
    public ResponseEntity getLogin(@RequestParam("code") String code) {
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
        System.out.println("our Token : " + jwtToken);
        //JWT 가 담긴 헤더와 200 ok 스테이터스 값, "success" 라는 바디값을 ResponseEntity 에 담아 프론트 측에 전달한다.
        return ResponseEntity.ok().headers(headers).body(null);
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

    //@GetMapping("/nickname")
//    @PostMapping("/nickname")
//    public ResponseEntity<Object> setNickname(HttpServletRequest request, @RequestParam) {
//        UserEntity user = userService.getUser(request);
//        return null;
//        //TODO : 여기 부분 채우기
//    }
}
