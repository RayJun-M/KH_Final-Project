package com.urfavoriteott.ufo.contents.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Review {

    private int reviewNo;
    private String userNo;
    private String movieId;
    private String tvId;
    private double reviewStar;
    private String reviewContent;
    private Date reviewRegisterDate;
    private String reviewStatus;
}