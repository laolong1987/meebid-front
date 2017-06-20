package com.meebid.front.bean;

/**
 * Created by gaoyang on 17/6/20.
 */
public class ResponseItemResult {
    String commodityId;
    Integer lotNumber;

    public String getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getLotNumber() {
        return lotNumber;
    }

    public void setLotNumber(Integer lotNumber) {
        this.lotNumber = lotNumber;
    }
}
