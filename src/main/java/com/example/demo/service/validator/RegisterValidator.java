package com.example.demo.service.validator;

import com.example.demo.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import com.example.demo.domain.dto.RegisterDTO;
import org.springframework.stereotype.Service;

@Service
public class RegisterValidator implements ConstraintValidator<com.example.demo.service.validator.RegisterChecked, RegisterDTO> {

    private final UserService userService;
    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }
    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords không chính xác")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here
        if(this.userService.checkEmailExists(user.getEmail())){
            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
