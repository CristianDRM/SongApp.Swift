//
//  Song.swift
//  SongApp
//
//  Created by cintia santos on 05/06/22.
//

import UIKit
class Song{
    var songName : String
    var bandImage : UIImage
    var bandName : String
    var link: String
    
    
    init(name: String, image: UIImage, band: String, bandLink: String ){
        songName = name
        bandImage = image
        bandName = band
        link = bandLink
    }
}
