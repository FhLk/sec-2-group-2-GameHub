package sit.int202.classicmodelweb.Repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodelweb.entities.Product;
import sit.int202.classicmodelweb.services.EntityManagerService;

import java.util.List;

public class ProductRepository {

    private static final int PAGE_SIZE = 10;

    private EntityManager getEntityManager() {

        return EntityManagerService.getEntityManager();
    }
   public  Product findProduct(String productCode){
        return find(productCode);
   }
    public Product find(String productCode) {
        EntityManager entityManager = getEntityManager();
        Product product = entityManager.find(Product.class, productCode);
        entityManager.close();
        return product;
    }
    public int getDefaultPageSize() {
        return PAGE_SIZE;
    }

    public List<Product> findAll(int page, int pageSize) {
        int startPosition = (page - 1) * pageSize;
        EntityManager entityManager = getEntityManager();
        Query query = entityManager.createNamedQuery("Product.FindAll");
        query.setFirstResult(startPosition);
        query.setMaxResults(pageSize);
        List<Product> productList = query.getResultList();
        entityManager.close();
        return productList;
    }

    public int countAll() {
        EntityManager entityManager = getEntityManager();
        int number = ((Number) entityManager.createNamedQuery("Product.Count").getSingleResult()).intValue();
        entityManager.close();
        return number;
    }
}
