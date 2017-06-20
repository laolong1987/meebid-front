package com.meebid.front.bean;

/**
 * Created by gaoyang on 17/6/20.
 */
public class RequestItem {
    String auctionId;
    String category;
    String description;
    Integer estimateMax;
    Integer estimateMin;
    Integer lotNumber;
    Integer reservePrice;
    Integer startingPrice;
    String name;
    String[] imgPaths;

    public String getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(String auctionId) {
        this.auctionId = auctionId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getEstimateMax() {
        return estimateMax;
    }

    public void setEstimateMax(Integer estimateMax) {
        this.estimateMax = estimateMax;
    }

    public Integer getEstimateMin() {
        return estimateMin;
    }

    public void setEstimateMin(Integer estimateMin) {
        this.estimateMin = estimateMin;
    }

    public Integer getLotNumber() {
        return lotNumber;
    }

    public void setLotNumber(Integer lotNumber) {
        this.lotNumber = lotNumber;
    }

    public Integer getReservePrice() {
        return reservePrice;
    }

    public void setReservePrice(Integer reservePrice) {
        this.reservePrice = reservePrice;
    }

    public Integer getStartingPrice() {
        return startingPrice;
    }

    public void setStartingPrice(Integer startingPrice) {
        this.startingPrice = startingPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getImgPaths() {
        return imgPaths;
    }

    public void setImgPaths(String[] imgPaths) {
        this.imgPaths = imgPaths;
    }
}
