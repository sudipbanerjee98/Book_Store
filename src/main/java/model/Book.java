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
    private int quantity;

    public Book() {
    	
    }
    public Book(String title, String author, double price,int quantity) {
        this.title = title; this.author = author; this.price = price;this.quantity=quantity;
    }
}
