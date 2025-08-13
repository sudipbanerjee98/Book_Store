package model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private String author;
    private double price;

    public Book() {
    	
    }
    public Book(String title, String author, double price) {
        this.title = title; this.author = author; this.price = price;
    }
}
