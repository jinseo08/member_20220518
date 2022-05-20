package com.its.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;


    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if(saveResult > 0){
            return true;
        }else {
            return false;
        }

    }

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        return memberDTOList;
    }


    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginResult = memberRepository.login(memberDTO);
        return loginResult;
    }


    public MemberDTO findById(Long id) {
        MemberDTO memberDTO = memberRepository.findById(id);
        return memberDTO;
    }

    public boolean delete(Long id) {
        int memberDelete = memberRepository.delete(id);
        if(memberDelete > 0){
            return true;
        } else {
            return false;
        }
    }
}
