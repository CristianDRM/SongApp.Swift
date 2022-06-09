//
//  SongDetailViewController.swift
//  SongApp
//
//  Created by cintia santos on 08/06/22.
//

import UIKit
import SafariServices

class SongDetailViewController: UIViewController {

    @IBOutlet weak var bandImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var bandNameLabel: UILabel!
    
    let song:  Song
    
    init(selectedSong: Song ){
        song = selectedSong
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes da  música"
        bandImageView.image = song.bandImage
        songNameLabel.text = song.songName
        bandNameLabel.text = song.bandName
    }


    @IBAction func openSongLink(_ sender: Any) {
        let url = URL(string: song.link)
        let safari = SFSafariViewController(url: url!)
        navigationController?.pushViewController(safari, animated: true)
    }
        
    }
    


