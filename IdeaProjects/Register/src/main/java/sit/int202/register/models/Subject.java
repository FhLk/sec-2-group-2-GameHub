/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int202.register.models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Khaitong Lim
 */
public class Subject {

    private static void initializedGrade() {
        GRADE.put(0.0, "F");
        GRADE.put(1.0, "D");
        GRADE.put(1.5, "D+");
        GRADE.put(2.0, "C");
        GRADE.put(2.5, "C+");
        GRADE.put(3.0, "B");
        GRADE.put(3.5, "B+");
        GRADE.put(4.0, "A");

        GRADE_STR.put("F", 0.0);
        GRADE_STR.put("D", 1.0);
        GRADE_STR.put("D+", 1.5);
        GRADE_STR.put("C", 2.0);
        GRADE_STR.put("C+", 2.5);
        GRADE_STR.put("B", 3.0);
        GRADE_STR.put("B+", 3.5);
        GRADE_STR.put("A", 4.0);
    }

    //private final int semester;
    private final String subjectId;
    private final String title;
    private final Double credit;
    private Double grade = null;

    private final static Map<Double, String> GRADE;
    private final static Map<String, Double> GRADE_STR;

    static {
        GRADE = new HashMap();
        GRADE_STR = new HashMap();
        initializedGrade();
    }

    public Subject(String id, String title, double credit) {
        this.subjectId = id;
        this.title = title;
        this.credit = credit;
    }

    public List<String> getAllGradeString() {
        List<String> grades = new ArrayList(GRADE.values());
        Collections.sort(grades);
        return grades;
    }

    public List<Double> getAllGrade() {
        List<Double> grades = new ArrayList(GRADE_STR.values());
        Collections.sort(grades);
        return grades;
    }

    public double getGrade() {
        return grade;
    }

    public String getGradeString() {
        return GRADE.get(grade);
    }

    public void setGrade(double grade) {
        if (GRADE.get(grade) == null) {
            throw new IllegalArgumentException("Invalid Grade Pattern " + grade + " ... should be 0.0, 1.0, 1.5, ... 4.0 ");
        }
        this.grade = grade;
    }

    public void setGradeString(String grade) {
        grade = grade.toUpperCase();
        if (GRADE_STR.get(grade) == null) {
            throw new IllegalArgumentException("Invalid Grade Pattern " + grade + " ... should be F, D, D+, ... A");
        }
        this.grade = GRADE_STR.get(grade);
    }

    public String getSubjectId() {
        return subjectId;
    }

    public String getTitle() {
        return title;
    }

    public double getCredit() {
        return credit;
    }

    @Override
    public String toString() {
        return String.format("%7s %-50s %3.1f %s", subjectId, title, credit, getGradeString());
    }
}
