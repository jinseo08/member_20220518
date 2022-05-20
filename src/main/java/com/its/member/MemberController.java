package com.its.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        boolean saveResult = memberService.save(memberDTO);
        if(saveResult){
            return "login";
        }else {
            System.out.println("회원가입 실패");
            return "save";
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
        MemberDTO loginResult = memberService.login(memberDTO);
        // 세션(session)
        if(loginResult != null){
            model.addAttribute("memberLogin",loginResult);
            session.setAttribute("memberId",loginResult.getMemberId());
            session.setAttribute("id",loginResult.getId());
            return "main";
        }else {
            return "login";
        }
    }

    @GetMapping("/detail")
    public String findById(@RequestParam Long id, Model model){
         MemberDTO memberDTO = memberService.findById(id);
         model.addAttribute("memberDetail",memberDTO);
        return "detail";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam Long id){
        boolean memberDelete = memberService.delete(id);
        if(memberDelete){
            // 회원 목록을 불러오기 위한 redirect 이용하여 findAll 주소 요청
            return "redirect:/findAll";
        }else {
            return "detail";
        }
    }

}
