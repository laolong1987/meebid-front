package com.meebid.front.exception;

import com.meebid.front.bean.ErrorBean;

/**
 * Created by gaoyang on 17/2/19.
 */
public class ErrorException extends RuntimeException{

    ErrorBean errorBean;

    public ErrorException(ErrorBean errorBean){
        this.errorBean=errorBean;
    }

    public ErrorBean getErrorBean() {
        return errorBean;
    }

    public void setErrorBean(ErrorBean errorBean) {
        this.errorBean = errorBean;
    }
}
