package pl.coderslab.charity.Status;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.Institution.Institution;

@Repository
public interface StatusRepository extends JpaRepository<Status, Long> {

    Status findStatusByDonation_Id(Long id);
}
