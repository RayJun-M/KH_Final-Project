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
public class Movie {

    private int movieId;
    private String originalTitle;
    private String title;
    private String genres;
    private String tagLine;
    private String overview;
    private int runtime;
    private Date releaseDate;
    private String director;
    private String cast;
    private int certification;
    private String productionName;
    private String productionCountry;
    private String productionLogoPath;
    private int collectionId;
    private String collectionName;
    private String backdropPath;
    private String posterPath;
    private String videoKey;
    private int views;
    private Date registerDate;
    private String movieStatus;
    private Date deleteDate;

    public static final String BASEURL = "https://api.themoviedb.org/3/";
    public static final String KEY = "?api_key=40154e686dd0abd5dd77271873687488";
    public static final String LANGUAGE = "&language=ko";
    public static final String PAGE = "&page=1";
    public static final String SEARCHCONTENTS = "search/multi";
    public static final String SEARCHQUERY = "&query=";
    public static final String ADULT = "&include_adult=false";
}