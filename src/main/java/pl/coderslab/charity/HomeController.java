package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Donation.Donation;
import pl.coderslab.charity.Donation.DonationRepository;
import pl.coderslab.charity.Institution.InstitutionRepository;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;


@Controller
public class HomeController {

private final InstitutionRepository institutionRepository;
private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        List<Donation> donations = donationRepository.findAll();
        AtomicInteger bags = new AtomicInteger();
        donations.forEach(d-> bags.addAndGet(d.getQuantity()));
        model.addAttribute("bags_amount", bags);
        model.addAttribute("donations_amount", donations.stream().map(Donation::getQuantity).count());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "home";
    }
}
