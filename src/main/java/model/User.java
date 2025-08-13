package model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @Column(unique = true)
    private String email;

    private String password;

    public User() { 
    	
    }

    public User(String name, String email, String password) {
        this.name = name; this.email = email; this.password = password;
    }
}
