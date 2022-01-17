package pl.coderslab.charity.Donation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;
import pl.coderslab.charity.User.CurrentUser;

import javax.validation.Valid;

@Controller
@Slf4j
public class DonationController {
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationService donationService;

    public DonationController(DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationService donationService) {
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationService = donationService;
    }

    @GetMapping(value = "/form")
    public String donationForm(Model model) {
        model.addAttribute("categoriesList", categoryRepository.findAll());
        model.addAttribute("institutionsList", institutionRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping(value = "/form")
    public String donationProcess(@Valid Donation donation, BindingResult bindingResult, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("donation", new Donation());
            model.addAttribute("errors", bindingResult.getModel());
            model.addAttribute("categoriesList", categoryRepository.findAll());
            model.addAttribute("institutionsList", institutionRepository.findAll());
            return "form";
        }
        donationService.saveDonation(currentUser,donation);
        return "confirmation";
    }
    @RequestMapping(value = "donation/{id}/delete")
    public String deleteDonation(@PathVariable Long id){
        donationRepository.deleteById(id);
    return "redirect:/user/dashboard";
    }

}
