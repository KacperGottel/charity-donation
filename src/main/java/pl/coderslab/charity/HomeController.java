package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.Donation.Donation;
import pl.coderslab.charity.Donation.DonationRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;
import pl.coderslab.charity.User.User;
import pl.coderslab.charity.User.UserService;
import pl.coderslab.charity.User.user_dto.UserDto;

import javax.validation.Valid;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserService userService;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, UserService userService) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userService = userService;
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
            userService.saveUser(user);
            return "redirect:/login";
        } else {
            model.addAttribute("confirm", "niepoprawne powtórzenie hasła");
        } return "register";
    }
}
