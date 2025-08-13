package dao;

import model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

public class UserDao{

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et=em.getTransaction();
    public User validateUser(String email, String password) {
        User user = null;
        try {
            // Use native query explicitly
            Query query = em.createNativeQuery(
                "SELECT * FROM users WHERE email = ? AND password = ?", User.class);
            query.setParameter(1, email);
            query.setParameter(2, password);
            user = (User) query.getSingleResult();
        } catch (NoResultException e) {
            // no user found, return null
        } finally {
            em.close();
        }
        return user;
    }

	public void save(String email, String password) {
        		et.begin();
        		em.persist(password);
        		em.persist(email);
        		et.commit();
	}
}
