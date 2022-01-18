package pl.coderslab.charity.User;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.Donation.Donation;
import pl.coderslab.charity.Donation.DonationRepository;
import pl.coderslab.charity.Institution.Institution;
import pl.coderslab.charity.Institution.InstitutionRepository;
import pl.coderslab.charity.Mail.EmailService;
import pl.coderslab.charity.Status.Status;
import pl.coderslab.charity.Status.StatusRepository;

import javax.validation.Valid;

@Controller
@Slf4j
public class UserController {

    private final InstitutionRepository institutionRepository;
    private final UserRepository userRepository;
    private final UserService userService;
    private final DonationRepository donationRepository;
    private final StatusRepository statusRepository;
    private final CategoryRepository categoryRepository;
    private final EmailService emailService;

    public UserController(InstitutionRepository institutionRepository, UserRepository userRepository, UserService userService, DonationRepository donationRepository, StatusRepository statusRepository, CategoryRepository categoryRepository, EmailService emailService) {
        this.institutionRepository = institutionRepository;
        this.userRepository = userRepository;
        this.userService = userService;
        this.donationRepository = donationRepository;
        this.statusRepository = statusRepository;
        this.categoryRepository = categoryRepository;
        this.emailService = emailService;
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
    @RequestMapping(value = "/donation/{id}/update")
    public String donationUpdateForm(@PathVariable Long id, Model model){
        model.addAttribute("donation",donationRepository.getById(id));
        model.addAttribute("categories",categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("status", statusRepository.findStatusByDonation_Id(id));
        return "donation";
    }
    @PostMapping(value = "/donation/update")
    public String donationUpdateProcess(@Valid Donation donation, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()){
            return "donation";
        }
        donationRepository.save(donation);
        return "redirect:/user/dashboard";
    }
    @PostMapping(value = "/status/update")
    public String donationUpdateProcess(@Valid Status status, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()){
            return "donation";
        }
        statusRepository.save(status);
        return "redirect:/user/dashboard";
    }


}
