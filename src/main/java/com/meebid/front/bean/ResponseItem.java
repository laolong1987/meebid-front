package com.meebid.front.bean;

/**
 * Created by gaoyang on 17/6/20.
 */
public class ResponseItem {
    Integer failure;
    Integer success;
    ResponseItemResult results[];

    public Integer getFailure() {
        return failure;
    }

    public void setFailure(Integer failure) {
        this.failure = failure;
    }

    public Integer getSuccess() {
        return success;
    }

    public void setSuccess(Integer success) {
        this.success = success;
    }

    public ResponseItemResult[] getResults() {
        return results;
    }

    public void setResults(ResponseItemResult[] results) {
        this.results = results;
    }
}
