package com.its.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/update-form")
    public String updateForm(HttpSession session,Model model){
        // 로그인을 한 상태기 때문에 세션에 id, memberId가 들어있고 여기서 세션에 있는 id를 가져온다.
        Long updateId = (Long) session.getAttribute("id");
        System.out.println("updateId = " + updateId);
        //DB에서 해당 회원의 정보를 가져와서 그 정보를 가지고 update.jsp로 이동
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        System.out.println("MemberController.update");
        System.out.println("memberDTO = " + memberDTO);
        boolean updateResult = memberService.update(memberDTO);
        if(updateResult){
            // 해당 회원의 상세정보
            // redirect에 memberDTO.getId()를 파라미터로 넘김
            return "redirect:/detail?id=" + memberDTO.getId();
        }else {
            return null;
        }
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam String memberId){
        System.out.println("memberId = " + memberId);
        // memberId를 DB에서 중복값이 있는지 없는지 체크하고
        // 없으면 ok, 있으면 no 라는 String 값을 리턴받으세요.
        String checkResult = memberService.duplicateCheck(memberId);
        // return checkResult; 를 하면 ok.jsp 또는 no.jsp를 찾기때문에 이렇게 쓰면 안됨
        System.out.println("checkResult = " + checkResult);
        return checkResult;
    }

    @GetMapping("/response-test")
    public @ResponseBody String responseTest(){
        return "main";
    }

    @GetMapping("/response-test2")
    public @ResponseBody List<MemberDTO> responseTest2(){
        return memberService.findAll();
    }


}
