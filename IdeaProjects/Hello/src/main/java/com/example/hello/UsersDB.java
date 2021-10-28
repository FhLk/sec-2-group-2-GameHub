package com.example.hello;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class UsersDB {
    private static UsersDB instance = new UsersDB();

    Map<String, User> userMap = new HashMap<String, User>();

    public UsersDB(){

        //Initialize the DB with some sample data

        addUser("yotam","1234",new String[]{"tedy","ofek","rotem"});
        addUser("tedy","666",new String[]{"yotam","ofek","rotem","nanduri"});
        addUser("ofek","2323",new String[]{"tedy","rotem","yotam"});
        addUser("rotem","2221",new String[]{"tedy","ofek","yotam"});
        addUser("nanduri","1111",new String[]{"tedy","ofek"});
    }

    private void addUser(String name, String phone, String[] friends) {
        User user = new User(name, phone);
        user.setFriends(Arrays.asList(friends));
        userMap.put(name, user);
    }

    public static UsersDB getInstance() {
        return instance;
    }

    public User getUser(String userId) {
        return userMap.get(userId);
    }

    public Collection<User> getAllUsers() {
        return userMap.values();
    }
}

