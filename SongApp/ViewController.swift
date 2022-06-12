//
//  ViewController.swift
//  SongApp
//
//  Created by cintia santos on 05/06/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var songList: [Song] = []
    private let cellId = "cellBandId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lista de músicas"
        configureSongList()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil),
                           forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureSongList() {
        songList.append(contentsOf: [
            Song(name:"Sutilmente",
                 bandImage: UIImage(imageLiteralResourceName: "skank"),
                 band: "Skank",
                 link: "www.google.com"),
            Song(name: "Wonderwall",
                 bandImage: UIImage(imageLiteralResourceName: "wonderwall"),
                 band: "Oasis",
                 link: "www.google.com"),
            Song(name: "YellowSubmarine",
                  bandImage: UIImage(imageLiteralResourceName: "os beatles"),
                  band: "Beatles",
                  link: "www.google.com"),
            Song(name: "Let it be",
                 bandImage: UIImage(imageLiteralResourceName: "os beatles"),
                 band: "Beatles",
                 link: "www.google.com")
        ])
    }
    
    func tableView(_ _tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SongTableViewCell
        
        let song = songList [indexPath.row]
        cell.songNameLabel?.text = song.name
        cell.bandImageView?.image = song.bandImage
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songList[indexPath.row]
        
        let songDetailVC = SongDetailViewController(selectedSong: song)
        navigationController?.pushViewController(songDetailVC, animated: true)
    }
}
