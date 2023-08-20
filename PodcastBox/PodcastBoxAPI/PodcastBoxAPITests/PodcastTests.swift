//
//  PodcastTests.swift
//  PodcastBoxAPITests
//
//  Created by Muhammed Karakul on 26.06.2022.
//

import XCTest
@testable import PodcastBoxAPI

class PodcastTests: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //{
        //    "artistName": "Storytel",
        //    "id": "1458003492",
        //    "name": "Nasıl Olunur",
        //    "kind": "podcasts",
        //    "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Podcasts125/v4/a2/e7/65/a2e765f3-be0b-23d1-da29-c8aac957d9da/mza_3773305927165867661.jpg/100x100bb.png",
        //    "genres": [
        //        {
        //            "genreId": "1301",
        //            "name": "Arts",
        //            "url": "https://itunes.apple.com/tr/genre/id1301"
        //        },
        //        {
        //            "genreId": "1324",
        //            "name": "Society & Culture",
        //            "url": "https://itunes.apple.com/tr/genre/id1324"
        //        }
        //    ],
        //    "url": "https://podcasts.apple.com/tr/podcast/nas%C4%B1l-olunur/id1458003492"
        //}
        
        let bundle = Bundle(for: PodcastTests.self)
        guard let url = bundle.url(forResource: "podcast", withExtension: "json") else {
            fatalError("podcast.json file not found.")
        }
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let podcast = try decoder.decode(Podcast.self, from: data)
        print(podcast)
        
        XCTAssertEqual(podcast.artistName, "Storytel")
        XCTAssertEqual(podcast.name, "Nasıl Olunur")
        XCTAssertEqual(podcast.artwork, URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Podcasts125/v4/a2/e7/65/a2e765f3-be0b-23d1-da29-c8aac957d9da/mza_3773305927165867661.jpg/100x100bb.png"))
        XCTAssertEqual(podcast.genres.count, 2)
        XCTAssertEqual(podcast.genres.first?.name, "Arts")
        XCTAssertEqual(podcast.genres.last?.name, "Society & Culture")
    }
}
