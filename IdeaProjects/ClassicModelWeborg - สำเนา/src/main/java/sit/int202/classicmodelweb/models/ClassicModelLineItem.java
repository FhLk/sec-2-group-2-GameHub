package sit.int202.classicmodelweb.models;

import sit.int202.classicmodelweb.entities.Product;

public class ClassicModelLineItem implements  CartItem{
    private Product product;
    private int quantity ;
    private double percentDiscount;

    public ClassicModelLineItem(Product product) {
        this(product, 1, 0.0);
    }

    public ClassicModelLineItem(Product product, int quantity) {
        this(product, quantity, 0.0);
    }

    public ClassicModelLineItem(Product product, int quantity, double percentDiscount) {
        this.product = product;
        this.quantity = quantity;
        this.percentDiscount = percentDiscount;
    }

    public Product getProduct() {
        return product;
    }

    @Override
    public int getQuantity() {
        return quantity;
    }

    @Override
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public double getUnitPrice() {
        return product.getMsrp().doubleValue();
    }

    @Override
    public double getTotal() {
        return getUnitPrice()*getQuantity() -
                getUnitPrice()*getQuantity()*percentDiscount;
    }

    @Override
    public double getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(double percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    @Override
    public String toString() {
        return  '{' + product.getProductName() +
                ", " + getUnitPrice() +
                ", " + quantity +
                ", " + percentDiscount +
                "% }";
    }
}

