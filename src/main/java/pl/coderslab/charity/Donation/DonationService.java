package pl.coderslab.charity.Donation;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.User.CurrentUser;
import pl.coderslab.charity.User.User;

@Service
public interface DonationService {

    void saveDonation(@AuthenticationPrincipal CurrentUser currentUser, Donation donation);
}
