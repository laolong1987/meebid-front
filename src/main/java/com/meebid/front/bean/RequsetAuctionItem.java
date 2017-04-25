package com.meebid.front.bean;

import java.util.List;

/**
 * Created by gaoyang on 17/4/25.
 */
public class RequsetAuctionItem {
    private String auctionId;
    private String category;
    private String description;
    private String name;
    private Integer estimateMax;
    private Integer estimateMin;
    private Integer lotNumber;
    private Integer reservePrice;
    private Integer startingPrice;
    List<String> imgPaths;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(String auctionId) {
        this.auctionId = auctionId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public List<String> getImgPaths() {
        return imgPaths;
    }

    public void setImgPaths(List<String> imgPaths) {
        this.imgPaths = imgPaths;
    }
}
