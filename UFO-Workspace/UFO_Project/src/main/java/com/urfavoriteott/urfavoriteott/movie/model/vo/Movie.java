package com.urfavoriteott.urfavoriteott.movie.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Movie {

    private String poster_path;
	private boolean adult;
	private String overview;
	private String release_date;
	private int[] genre_ids;
	private String id;
	private String original_title;
	private String original_language;
	private String title;
	private String backdrop_path;
	private double popularity;
	private int vote_count;
	private boolean video;
	private double vote_average;
	private String video_key;
}