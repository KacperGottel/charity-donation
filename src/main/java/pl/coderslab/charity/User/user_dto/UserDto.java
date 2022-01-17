package pl.coderslab.charity.User.user_dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;

@Data
@Component
public class UserDto {
    @NotNull
    @Email
    private String email;
    @NotNull
    @Size(min = 2, max = 10)
    private String username;
    @NotNull
    @Size(min = 2, max = 10)
    private String password;
}
