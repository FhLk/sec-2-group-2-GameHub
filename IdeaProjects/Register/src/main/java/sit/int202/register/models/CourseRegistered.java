/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int202.register.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Khaitong Lim
 */
public class CourseRegistered {
    private Map<Integer, List<Subject>> registeredSubjects = new HashMap<>();

    public void registerSubject(int semester, Subject subject) {
        if (registeredSubjects.get(semester)==null) {
            registeredSubjects.put(semester, new ArrayList<>());
        }
        registeredSubjects.get(semester).add(subject);
    }
    public void removeAllRegisteredCourse(int semester) {
        registeredSubjects.remove(semester);
    }

    public void removeAllRegisteredCourse() {
        registeredSubjects.clear();
    }

    public List<Subject> getRegisteredCourse(int semester) {
        return registeredSubjects.get(semester);
    }
    public Map<Integer, List<Subject>> getHistory() {
        return this.registeredSubjects ;
    }
}
