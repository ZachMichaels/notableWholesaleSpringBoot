package com.notable.data;

import java.io.*;
import java.util.*;

import com.notable.business.*;

public class UserIO {

    public static boolean add(User user, String filepath) {
        try {
            File file = new File(filepath);
            PrintWriter out = new PrintWriter(
                    new FileWriter(file, true));
            out.println(user.getEmail() + "|"
                    + user.getFirstName() + "|"
                    + user.getLastName());

            out.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static User getUser(String email, String filepath) {
        try {
            File file = new File(filepath);
            BufferedReader in = new BufferedReader(
                    new FileReader(file));
            User user = new User();
            String line = in.readLine();
            while (line != null) {
                StringTokenizer t = new StringTokenizer(line, "|");
                if (t.countTokens() < 3) {
                    return new User(0, "", "", "", "", "", "", "", "", "","");
                }
                String token = t.nextToken();
                if (token.equalsIgnoreCase(email)) {
                    String firstName = t.nextToken();
                    String lastName = t.nextToken();
                    user.setEmail(email);
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                }
                line = in.readLine();
            }
            in.close();
            return user;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<User> getUsers(String filepath) {
        try {
            ArrayList<User> users = new ArrayList<User>();
            BufferedReader in = new BufferedReader(
                    new FileReader(filepath));
            String line = in.readLine();
            while (line != null) {
                StringTokenizer t = new StringTokenizer(line, "|");
                String email = t.nextToken();
                String firstName = t.nextToken();
                String lastName = t.nextToken();
                String address1 = t.nextToken();
                String address2 = t.nextToken();
                String city = t.nextToken();
                String state = t.nextToken();
                String zip = t.nextToken();
                String country = t.nextToken();
                String password = t.nextToken();
                User user = new User(0, firstName, lastName, email, address1, address2, city, state, zip, country, password);
                users.add(user);
                line = in.readLine();
            }
            in.close();
            return users;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
