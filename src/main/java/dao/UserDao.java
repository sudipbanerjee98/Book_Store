//package dao;
//
//import model.User;
//import jakarta.persistence.EntityManager;
//import jakarta.persistence.EntityManagerFactory;
//import jakarta.persistence.EntityTransaction;
//import jakarta.persistence.NoResultException;
//import jakarta.persistence.Persistence;
//import jakarta.persistence.Query;
//
//public class UserDao{
//
//    EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
//    EntityManager em = emf.createEntityManager();
//    EntityTransaction et=em.getTransaction();
//    public User validateUser(String email, String password) {
//        User user = null;
//        try {
//            // Use native query explicitly
//            Query query = em.createNativeQuery(
//                "SELECT * FROM User WHERE email = ? AND password = ?");
//            query.setParameter(1, email);
//            query.setParameter(2, password);
//            user = (User) query.getSingleResult();
//        } catch (NoResultException e) {
//            // no user found, return null
//        } finally {
//            em.close();
//        }
//        return user;
//    }
//
////	public void save(String email, String password) {
////        		et.begin();
////        		em.persist(password);
////        		em.persist(email);
////        		et.commit();
////	}
//}
package dao;

import jakarta.persistence.*;
import model.User;

public class UserDao {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");

    public boolean saveUser(User user) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    public User validateUser(String email, String password) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.email = :email AND u.password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
}
