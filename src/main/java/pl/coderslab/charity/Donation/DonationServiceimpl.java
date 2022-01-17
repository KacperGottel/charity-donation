package pl.coderslab.charity.Donation;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.User.CurrentUser;

@Service
public class DonationServiceimpl implements DonationService{

    private final DonationRepository donationRepository;

    public DonationServiceimpl(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Override
    public void saveDonation(@AuthenticationPrincipal CurrentUser currentUser, Donation donation) {
        donation.setUser(currentUser.getUser());
        donationRepository.save(donation);
    }
}
