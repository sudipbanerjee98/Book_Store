package dao;

import model.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import java.util.List;

public class BookDao {

     EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");

    public List<Book> getAllBooks() {
        EntityManager em = emf.createEntityManager();
        List<Book> books = null;
//        try {
            @SuppressWarnings("unused")
			Query query = (Query) em.createNativeQuery("SELECT * FROM Book", Book.class).getResultList();
//        } finally {
//            em.close();
//        }
        return books;
    }

    @SuppressWarnings("unchecked")
	public List<Book> searchBooks(String keyword) {
        EntityManager em = emf.createEntityManager();
        List<Book> books = null;
//        try {
            Query query = em.createNativeQuery("SELECT * FROM Book WHERE title LIKE ? OR author LIKE ?", Book.class);
            String pattern = "%" + keyword + "%";
            query.setParameter(1, pattern);
            query.setParameter(2, pattern);
            books = query.getResultList();
//        } finally {
//            em.close();
//        }
        return books;
    }

    public Book getBookById(int id) {
        EntityManager em = emf.createEntityManager();
        Book book = null;
        try {
            Query query = em.createNativeQuery(
                "SELECT * FROM Book WHERE id = ?", Book.class);
            query.setParameter(1, id);
            book = (Book) query.getSingleResult();
        } finally {
            em.close();
        }
        return book;
    }
}
