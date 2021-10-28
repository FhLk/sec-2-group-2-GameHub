package sit.int202.simplewebapp.models;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class Student {
    private int id;
    private  String name;
    private  double gpax;
}
