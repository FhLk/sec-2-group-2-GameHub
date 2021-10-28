package sit.int202.simplewebapp.models;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class StudentRepository {
    private static Map<Integer, Student> studentMap = new HashMap<>(32, 0.5f);
    static  {
        studentMap.put(10001, new Student(10001, "Somchai", 2.50));
        studentMap.put(10002, new Student(10002, "Somchart", 3.50));
        studentMap.put(10003, new Student(10003, "Somrak", 1.50));
        studentMap.put(10004, new Student(10004, "Somsak", 2.40));
        studentMap.put(10005, new Student(10005, "Somsri", 2.60));
        studentMap.put(10006, new Student(10006, "Somkid", 2.70));
        studentMap.put(10007, new Student(10007, "Somjate", 2.80));
        studentMap.put(10008, new Student(10008, "Somsong", 2.950));
        studentMap.put(10009, new Student(10009, "Anuchai", 2.750));
        studentMap.put(10010, new Student(10010, "Anuchart", 2.55));
        studentMap.put(10011, new Student(10011, "Anuchit", 2.35));
        studentMap.put(10012, new Student(10012, "Anusak", 2.25));
        studentMap.put(10013, new Student(10013, "Anusit", 2.15));
        studentMap.put(10014, new Student(10014, "Anupong", 2.00));
    }

    public Student find(Integer id) {
        return studentMap.get(id);
    }

    public Student save(Student student) {
        return studentMap.put(student.getId(), student);
    }

    public Student remove(Student student) {
        return remove(student.getId());
    }

    public Student remove(Integer id) {
        return studentMap.remove(id);
    }

    public Collection<Student> all() {
        return studentMap.values();
    }
}
