/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int202.register.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Khaitong Lim
 */
public class Semester {
    private static final String[] TITLE = {null, "ภาค 1/ ปีการศึกษาที่ 1", "ภาค 2/ ปีการศึกษาที่ 1", "ภาค 1/ ปีการศึกษาที่ 2"
    , "ภาค 2/ ปีการศึกษาที่ 2", "ภาค 1/ ปีการศึกษาที่ 3", "ภาค 2/ ปีการศึกษาที่ 3", "ภาค 1/ ปีการศึกษาที่ 4"
    , "ภาค 2/ ปีการศึกษาที่ 4", "ภาคพิเศษ โครงการ WIL"};

    public static String[] getAllSemesterText() {
        return TITLE;
    }

     public static String getSemesterText(int semesterNumber) {
        if(semesterNumber>=TITLE.length) {
            return null;
        }
        return TITLE[semesterNumber];
    }
}
