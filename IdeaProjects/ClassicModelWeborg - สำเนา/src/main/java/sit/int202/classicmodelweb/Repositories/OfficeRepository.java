package sit.int202.classicmodelweb.Repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodelweb.entities.Office;
import sit.int202.classicmodelweb.entities.Product;
import sit.int202.classicmodelweb.services.EntityManagerService;

import java.util.List;

public class OfficeRepository {
    private EntityManager getEntityManager() {
        return EntityManagerService.getEntityManager();
    }


    public List<Office> findAll() {
        EntityManager entityManager = getEntityManager();
        List<Office> offices = entityManager.createNamedQuery("Office.FindAll").getResultList();
        entityManager.close();
        return offices;
    }
    public Office find(String officeCode) {
        EntityManager entityManager = getEntityManager();
        Office office = entityManager.find(Office.class, officeCode);
        entityManager.close();
        // Fetch type must be EAGER or set hibernate.enable_lazy_load_no_trans in persistence.xml when we close manager
        return office;
    }
    public boolean save(Office office) {

          try {
              EntityManager entityManager = getEntityManager();
              entityManager.getTransaction().begin();
              entityManager.persist(office);
              entityManager.getTransaction().commit();
              entityManager.close();
          }
          catch (Exception e) {
              return false;
          }
                return true;
    }
        public boolean update(Office office) {

          try {
              EntityManager entityManager = getEntityManager();
              entityManager.getTransaction().begin();
              entityManager.merge(office);
              entityManager.getTransaction().commit();
              entityManager.close();
          }
          catch (Exception e) {
              return false;
          }
                return true;
    }
    public boolean delete(Office office) {
        return delete(office.getId());
    }

    public boolean delete(String officeCode) {
        try {
            EntityManager entityManager = getEntityManager();
            entityManager.getTransaction().begin();
            Office office = find(officeCode);
            entityManager.remove(entityManager.contains(office) ? office : entityManager.merge(office));
            entityManager.getTransaction().commit();
            entityManager.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

}