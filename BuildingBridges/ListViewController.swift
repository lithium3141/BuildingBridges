//
//  ViewController.swift
//  BuildingBridges
//
//  Created by Tim Ekl on 11/7/17.
//  Copyright © 2017 Tim Ekl. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var originalArtistLabel: UILabel!
    @IBOutlet private var animatorLabel: UILabel!
    
    var song: AnimojiKaraoke? {
        didSet {
            guard let song = song else { return }
            songNameLabel.text = song.songTitle
            originalArtistLabel.text = song.originalArtist
            animatorLabel.text = song.animatorName
        }
    }
    
}

// MARK: -

class ListViewController: UITableViewController {
    
    typealias Section = (genre: Genre, songs: [AnimojiKaraoke])
    private var data: [Section] = []
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataStore.sharedInstance().enumerateSongsByGenre(with: EnumerationOptionListEveryGenre) { (genre, songs) in
            guard let realSongs = songs as? [AnimojiKaraoke] else { return }
            let section = (genre: genre, songs: realSongs)
            self.data.append(section)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let webViewController = segue.destination as? WebViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let song = data[indexPath.section].songs[indexPath.row]
        webViewController.title = song.songTitle
        webViewController.url = song.url
    }
    
    // MARK: UITableViewDataSource / UITableViewDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        cell.song = data[indexPath.section].songs[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return GenreLocalizedName(data[section].genre)
    }

}
