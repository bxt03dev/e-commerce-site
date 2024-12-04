package com.example.demo.service;

import com.example.demo.domain.Cart;
import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.domain.dto.RegisterDTO;
import com.example.demo.repository.CartRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.RoleRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CartRepository cartRepository;
    private final ProductRepository productRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, CartRepository cartRepository, ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.cartRepository = cartRepository;
        this.productRepository = productRepository;
    }


    public String handleHello(){
        return "Hello anh Truong dep trai!";
    }

    public Page<User> getAllUser(Pageable page){
        return this.userRepository.findAll(page);
    }

    public List<User> getAllUsersByEmail(String email){
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user){
        User bxt = this.userRepository.save(user);
        return bxt;
    }

    public User getUserById(long id){
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id){
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO){

        User user = new User();

        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());

        return user;
    }

    public boolean checkEmailExists(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countUsers(){
        return this.userRepository.count();
    }

    public long countCarts(){
        return this.cartRepository.count();
    }
}