package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsersMapper {

    User queryUser(User user);

    void addUser(User user);
}
