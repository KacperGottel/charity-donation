package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Institution.Institution;
import pl.coderslab.charity.Institution.InstitutionRepository;

import javax.validation.Valid;

@Controller
public class UserController {

    private final InstitutionRepository institutionRepository;

    public UserController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
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
    @DeleteMapping(value = "institution/{id}/delete")
    public String deleteInstitution(@PathVariable Long id){
        institutionRepository.deleteById(id);
        return "redirect:/institution/list";
    }

}
