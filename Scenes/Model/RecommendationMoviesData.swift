
//
//  RecommendationMoviesData.swift
//  MoviesTask
//
//  Created by ahmed mostafa on 10/3/20.
//

import Foundation

// MARK: - RecommendationMovies
struct RecommendationMovies: Codable {
    let page: Int
    let results: [RecommendationResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct RecommendationResult: Codable {
    let id: Int
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title, releaseDate: String
    let originalLanguage: OriginalLanguageRecommendation
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, posterPath: String
    let popularity: Double

    enum CodingKeys: String, CodingKey {
        case id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case posterPath = "poster_path"
        case popularity
    }
}

enum OriginalLanguageRecommendation: String, Codable {
    case en = "en"
    case fr = "fr"
    case zh = "zh"
}
