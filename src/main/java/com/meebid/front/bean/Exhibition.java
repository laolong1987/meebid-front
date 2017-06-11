package com.meebid.front.bean;

import java.util.List;

/**
 * Created by gaoyang on 17/6/11.
 */
public class Exhibition {
    String auctionId;
    String exhibitionAddress;
    String id;
    String timezone;

    public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    List<ExhibitionTime> exhibitionTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<ExhibitionTime> getExhibitionTime() {
        return exhibitionTime;
    }

    public void setExhibitionTime(List<ExhibitionTime> exhibitionTime) {
        this.exhibitionTime = exhibitionTime;
    }

    public String getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(String auctionId) {
        this.auctionId = auctionId;
    }

    public String getExhibitionAddress() {
        return exhibitionAddress;
    }

    public void setExhibitionAddress(String exhibitionAddress) {
        this.exhibitionAddress = exhibitionAddress;
    }
}
