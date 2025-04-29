package com.hospital.model;

public class User {
    private int id;
    private String name;
    private String username;
    private String password;
    private int roleId;
    private String roleName;

    public User() {}

    public User(int id, String name, String username, String password, int roleId, String roleName) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.roleName = roleName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
} 