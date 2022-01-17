package pl.coderslab.charity;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.Institution.Institution;
import pl.coderslab.charity.Institution.InstitutionRepository;
import pl.coderslab.charity.User.CurrentUser;
import pl.coderslab.charity.User.User;
import pl.coderslab.charity.User.UserRepository;
import pl.coderslab.charity.User.UserService;

import javax.validation.Valid;

@Controller
@Slf4j
public class UserController {

    private final InstitutionRepository institutionRepository;
    private final UserRepository userRepository;
    private final UserService userService;

    public UserController(InstitutionRepository institutionRepository, UserRepository userRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @RequestMapping(value = "/institution/list")
    public String listInstitution(Model model) {
        model.addAttribute("institutionList", institutionRepository.findAll());
        return "institution";
    }

    @RequestMapping(value = "/institution/add")
    public String addInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "institutionADD";
    }

    @PostMapping(value = "/institution/add")
    public String addInstitution(@Valid Institution institution, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "institutionADD";
        }
        institutionRepository.save(institution);
    return "redirect:/institution/list";
    }
    @RequestMapping(value = "/institution/{id}/delete")
    public String deleteInstitution(@PathVariable Long id){
        institutionRepository.deleteById(id);
        return "redirect:/institution/list";
    }
    @RequestMapping(value = "/user/dashboard")
    public String userForm(@AuthenticationPrincipal CurrentUser currentUser, Model model){
        model.addAttribute("userlogged",userRepository.getById(currentUser.getUser().getId()));
        return "user";
    }
    @PostMapping(value = "/user/dashboard")
    public String userFormProcess(@Valid User user, BindingResult bindingResult, Model model, @AuthenticationPrincipal CurrentUser currentUser){
        if(bindingResult.hasErrors()) {
            model.addAttribute("userlogged", userRepository.getById(currentUser.getUser().getId()));
        return "user";
        }
        userService.saveUser(user);
        return "redirect:/user/dashboard";
    }
    @RequestMapping(value = "user/delete")
    public String deleteUser(@AuthenticationPrincipal CurrentUser currentUser){
        userRepository.delete(currentUser.getUser());
        return "redirect:/user/dashboard";
    }

}
