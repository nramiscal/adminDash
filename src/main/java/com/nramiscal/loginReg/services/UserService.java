package com.nramiscal.loginReg.services;

import java.util.Date;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.nramiscal.loginReg.models.User;
import com.nramiscal.loginReg.repositories.RoleRepo;
import com.nramiscal.loginReg.repositories.UserRepo;


@Service
public class UserService {

	private UserRepo userRepo;
	private RoleRepo roleRepo;
	private BCryptPasswordEncoder bCPE;
	
	
	public UserService(UserRepo userRepo, RoleRepo roleRepo, BCryptPasswordEncoder bCPE) {
		this.userRepo = userRepo;
		this.roleRepo = roleRepo;
		this.bCPE = bCPE;
	}
	
	// add user role
    public void saveWithUserRole(User user) {
        user.setPassword(bCPE.encode(user.getPassword()));
        user.setRoles(roleRepo.findByName("ROLE_USER"));
        userRepo.save(user);
    }
    
    public void updateWithUserRole(User user) {
        user.setRoles(roleRepo.findByName("ROLE_USER"));
        userRepo.save(user);
    }
     
    // add admin role
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCPE.encode(user.getPassword()));
        user.setRoles(roleRepo.findByName("ROLE_ADMIN"));
        userRepo.save(user);
    }    
    
    public void updateUserWithAdminRole(User user) {
        user.setRoles(roleRepo.findByName("ROLE_ADMIN"));
        userRepo.save(user);
    }
    
    public User findByUsername(String username) {
        return userRepo.findByUsername(username);
        
    }
    
    public void updateUserDate(Long id, User user) {
		user.setUpdated_at(new Date());
		userRepo.save(user);	
    }
    
    public List<User> all(){
    		return (List<User>) userRepo.findAll();
    }
    
    public void deleteUserById(Long id) {
    		userRepo.delete(id);
    }
    
    public User findUserById(Long id) {
    		return userRepo.findOne(id);
    }
       
}
