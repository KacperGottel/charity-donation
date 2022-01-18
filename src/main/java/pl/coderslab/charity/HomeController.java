package pl.coderslab.charity;

import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.buf.HexUtils;
import org.hibernate.type.UUIDBinaryType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.Donation.Donation;
import pl.coderslab.charity.Donation.DonationRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;
import pl.coderslab.charity.Mail.EmailService;
import pl.coderslab.charity.User.User;
import pl.coderslab.charity.User.UserRepository;
import pl.coderslab.charity.User.UserService;
import pl.coderslab.charity.User.user_dto.UserDto;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;


@Controller
@Slf4j
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserService userService;
    private final EmailService emailService;
    private final UserRepository userRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, UserService userService, EmailService emailService, UserRepository userRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userService = userService;
        this.emailService = emailService;
        this.userRepository = userRepository;
    }

    @RequestMapping(value = "/login")
    public String loginForm() {
        return "login";
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        List<Donation> donations = donationRepository.findAll();
        AtomicInteger bags = new AtomicInteger();
        donations.forEach(d -> bags.addAndGet(d.getQuantity()));
        model.addAttribute("bags_amount", bags);
        model.addAttribute("donations_amount", donations.stream().map(Donation::getQuantity).count());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "home";
    }

    @RequestMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(@ModelAttribute("user") @Valid UserDto userDto,
                               BindingResult bindingResult, Model model, @RequestParam("confirm") String confirm) {

        if (bindingResult.hasErrors()) {
            return "register";
        }
        if (confirm.equals(userDto.getPassword())) {
            User user = new User();
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setPassword(userDto.getPassword());
            UUID uuid = UUID.randomUUID();
            user.setToken(uuid.toString());
            userService.saveUser(user);
            emailService.sendSimpleMessage(userDto.getEmail(), "Register",
                    "Kliknij w link by potwierdzić założenie konta: http://localhost:8080/confirm/user/" + uuid);
            return "redirect:/login";
        } else {
            model.addAttribute("confirm", "niepoprawne powtórzenie hasła");
        }
        return "register";
    }

    @RequestMapping(value = "/confirm/user/{uuid}")
    public String confirmMail(@PathVariable String uuid) {
        User userByToken = userRepository.findUserByToken(uuid);
        if (userRepository.existsById(userByToken.getId())){
        userByToken.setEnabled(true);
        userRepository.save(userByToken);
        } else {
            return "redirect:/login";
        }
        return "redirect:/login";
    }
}
