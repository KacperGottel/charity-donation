package pl.coderslab.charity.Donation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;

import javax.validation.Valid;

@Controller
@Slf4j
public class DonationController {
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }

    @GetMapping(value = "/form")
    public String donationForm(Model model) {
        model.addAttribute("categoriesList", categoryRepository.findAll());
        model.addAttribute("institutionsList", institutionRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping(value = "/form")
    public String donationProcess(@Valid Donation donation, BindingResult bindingResult, Model model) {
        log.error(donation.toString());
        if (bindingResult.hasErrors()) {
            model.addAttribute("donation", new Donation());
            model.addAttribute("errors", bindingResult.getModel());
            model.addAttribute("categoriesList", categoryRepository.findAll());
            model.addAttribute("institutionsList", institutionRepository.findAll());
            return "form";
        }
        donationRepository.save(donation);
        return "confirmation";
    }
}
