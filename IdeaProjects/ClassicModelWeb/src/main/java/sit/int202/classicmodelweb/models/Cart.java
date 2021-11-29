package sit.int202.classicmodelweb.models;

import sit.int202.classicmodelweb.entities.Product;
import sit.int202.classicmodelweb.Repositories.ProductRepository;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Cart<K, V extends CartItem> {
    private Map<K, V> map;

    public Cart() {
        this.map = new HashMap<>();
    }

    public int countItem() {
        return map.size();
    }

    public int countPiece() {
        return map.values().stream().mapToInt(o -> o.getQuantity()).sum();
    }

    public double getTotalPrice() {
        return map.values().stream().mapToDouble(o -> o.getTotal()).sum();
    }

    public void addItem(K key, V value) {
        V item = map.get(key);
        if (item == null) {
            map.put(key, value);
        } else {
            item.setQuantity(item.getQuantity() + value.getQuantity());
        }
    }

    public V removeItem(K key) {
        return map.remove(key);
    }

    public void clear() {
        map.clear();
    }

    public Collection<V> getAllItem() {
        return Collections.unmodifiableCollection(map.values());
    }
}
