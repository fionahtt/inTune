//
//  DataService.swift
//  inTune
//
//  Created by Fiona Thendean on 9/7/19.
//  Copyright © 2019 Fiona Thendean. All rights reserved.
//

import Foundation

let BASE_URL = "https://itunes.apple.com/search?media=music&term="

let LYRICS_URL = "https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=%song&q_artist=%artist&apikey=f03b1ee287def3f3448ea74490dd7788"

class DataService{
    
    static let instance = DataService()
    
    func getSongs (searchRequest: String, completion: @escaping ([Song])->()) {
        var songs = [Song]()
        let searchString = searchRequest.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "\(BASE_URL)\(searchString)")
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    if let songsResults = json["results"] as? NSArray {
                        for song in songsResults {
                            if let songInfo = song as? [String: AnyObject] {
                                guard let artistName = songInfo["artistName"] as? String else {return}
                                guard let trackName = songInfo["trackName"] as? String else {return}
                                guard let artworkUrl100 = songInfo["artworkUrl100"] as? String else {return}
                                let songInstance = Song(artistName: artistName, trackName: trackName, artworkUrl100: artworkUrl100)
                                songs.append(songInstance)
                            }
                        }
                        completion(songs)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
            }.resume()
    }
    
    
    func getLyrics (track: String, artist: String)->(String) {
        var trackLyrics = ""
        let trackString = track.replacingOccurrences(of: " ", with: "%20")
        let artistString = artist.replacingOccurrences(of: " ", with: "%20")
        let urlString = LYRICS_URL.replacingOccurrences(of: "%song", with: trackString).replacingOccurrences(of: "%artist", with: artistString)
        
        let url = URL(string: "\(urlString)")
        
        let session = URLSession.shared
        session.dataTask(with: url!) {(data, response, error) in
            if let data = data {
                do {
                    var toString = String(data: data, encoding: String.Encoding.utf8) as String?
                    toString = toString?.replacingOccurrences(of: "\n", with: "")
                    
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        if let json2 = json["message"] as? NSDictionary {
                            if let json3 = json2["body"] as? NSDictionary {
                                if let json4 = json3["lyrics"] as? NSDictionary {
                                    guard let lyricsBody = json4["lyrics_copyright"] as? String else {return}
                                    trackLyrics = lyricsBody
                                }
                            }
                        } else {return}
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
            }.resume()
        return trackLyrics
        }
    }

