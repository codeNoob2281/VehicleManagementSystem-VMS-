package com.model;
/*查勘员*/
public class Surveyor {
    private String id;//查勘员工号
    private boolean isViolation;//是否存在违规记录

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isViolation() {
        return isViolation;
    }

    public void setViolation(boolean violation) {
        isViolation = violation;
    }
}
