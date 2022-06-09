//
//  ViewController.swift
//  SongApp
//
//  Created by cintia santos on 05/06/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
  
    var songList: [Song] = []
    var cellId: String = "cellBandId"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureSongList()
       configureTableView()
        title = "Lista de músicas"
       // let songDetailVC = SongDetailViewController()
      //  navigationController?.pushViewController(songDetailVC, animated: true)
    
    }
    func configureTableView (){
        
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: cellId )
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    


    func configureSongList(){
        let sutilmente = Song (name:"Sutilmente", image: UIImage(imageLiteralResourceName: "skank"), band: "Skank", bandLink: "www.google.com" )
        songList.append(sutilmente)
        let wonderwall = Song (name: "Wonderwall", image: UIImage(imageLiteralResourceName: "wonderWall"), band: "Oasis", bandLink: "www.google.com"  )
        songList.append(wonderwall)
        
        let yellowSubmarine = Song (name: "YellowSubmarine", image: UIImage(imageLiteralResourceName: "os beatles"), band: "Beatles", bandLink: "www.google.com"  )
        songList.append(yellowSubmarine)
        let letItBe = Song (name: "Let it be", image: UIImage(imageLiteralResourceName: "os beatles"), band: "Beatles", bandLink: "www.google.com"  )
        songList.append(letItBe)
    }
    
    
func tableView(_ _tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return songList.count

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId ) as! songTableViewCell
        let row = indexPath.row
        let song = songList [row]
        cell.songNameLabel.text = song.songName
        cell.bandImageView.image = song.bandImage
        cell.selectionStyle = .none
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let song = songList[row]
        
        
        let songDetailVC = SongDetailViewController(selectedSong: song)
        navigationController?.pushViewController(songDetailVC, animated: true)
    }
}
