package com.its.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        return sql.insert("Member.save",memberDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }


    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById",id);
    }

    public int delete(Long id) {
        return sql.delete("Member.delete",id);
    }
}
