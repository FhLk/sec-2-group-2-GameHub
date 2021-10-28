package sit.int202.classicmodelweb.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "productlines")
@Entity
public class Productline {
    @Id
    @Column(name = "productLine", nullable = false, length = 50)
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}