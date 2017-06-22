package com.meebid.front.bean;

import java.util.List;

/**
 * Created by gaoyang on 17/6/23.
 */
public class RequestItemImg {
    String auctionId;
    List<String> images;
    String lotNumber;

    public String getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(String auctionId) {
        this.auctionId = auctionId;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getLotNumber() {
        return lotNumber;
    }

    public void setLotNumber(String lotNumber) {
        this.lotNumber = lotNumber;
    }
}
