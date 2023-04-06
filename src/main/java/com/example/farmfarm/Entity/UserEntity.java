package com.example.farmfarm.Entity;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;

@Entity
@Table(name="user")
public class UserEntity {
    @Id
    @GeneratedValue
    private int u_id;

    private String username;

    private String email;

    private String password;

    @CreationTimestamp
    private String create_time;

    private String id;

    private String user_role;

    private String platform;

    private String nickname;

    private String user_code;

    private String phone;

}
