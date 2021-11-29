package sit.int202.classicmodelweb;

import at.favre.lib.crypto.bcrypt.BCrypt;
import sit.int202.classicmodelweb.Repositories.CustomerRepository;
import sit.int202.classicmodelweb.Repositories.OfficeRepository;
import sit.int202.classicmodelweb.entities.Customer;
import sit.int202.classicmodelweb.entities.Office;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        CustomerRepository customerRepository=new CustomerRepository();
        String password1="1234";
        String password2="12345";
        Customer customer=customerRepository.findByName("Jean King");
        System.out.println(customer);
        BCrypt.Result result=BCrypt.verifyer().verify(password1.toCharArray(),customer.getPassword());
        System.out.println("Password "+ password1+ (result.verified?"is Matched": "is NOT matched"));

        customer=customerRepository.findByName("Kwai Lee");
        result=BCrypt.verifyer().verify(password2.toCharArray(),customer.getPassword());
        System.out.println(customer);
        System.out.println("Password "+ password2+ (result.verified?"is Matched":"is NOT matched"));

        customer=customerRepository.findByName("Khai Tong");
        System.out.println(customer);
//        ProductRepository productRepository=new ProductRepository();
//        System.out.println(productRepository.countAll());
//        System.out.println(productRepository.findAll(1,25));

        //        OfficeRepository or = new OfficeRepository();
//        Office office = or.find("1");
//        if (office.getCity().equalsIgnoreCase("Bangkok")){
//            office.setCity("San Francisco");
//        }else {
//            office.setCity("Bangkok");
//        }
//        or.update(office);
//        deleteOffice(or);
//        System.out.println(office);
//        System.out.println("--------------------------------------------------------------------");
//        System.out.printf("%10s %-10s %-12s %s\n", "ID", "Firstname", "Lastname", "E-mail");
//        office.getEmployeeList().forEach(e -> {
//            System.out.printf("%10d %-10s %-12s %s\n", e.getId(), e.getFirstName(), e.getLastName(), e.getEmail());
//        });

    }
    private static void saveOffice(OfficeRepository officeRepository) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter new office id: ");
        String officeCode = sc.next();
        System.out.print("Enter new office city: ");
        String city = sc.next();
        Office newOffice = new Office();
        newOffice.setId(officeCode);
        newOffice.setCity(city);
        newOffice.setCountry("TH");
        newOffice.setAddressLine1("126 Pracha-utit");
        newOffice.setPhone("012-345-6789");
        newOffice.setPostalCode("10140");
        newOffice.setTerritory("NA");
        if(! officeRepository.save(newOffice)) {
            System.out.println("Error: Can't insert new office");
        }
    }
    public static void deleteOffice(OfficeRepository officeRepository){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter office id to delete: ");
        String officeCode = sc.next();
        if(! officeRepository.delete(officeCode)){
            System.out.println("Error: Can't delete office");
        }else {
            System.out.println("Office has been Deleted: " + officeCode);
        }
    }
}