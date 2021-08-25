//
//  MovieCell.swift
//  MVC
//
//  Created by Binal on 25/08/2021.
//

import UIKit

class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"

    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var imgImageView: UIImageView!
    
    func configureCell(title: String?, overview: String?, imageData: Data? ){
        
        lblTitle.text = title
        lblOverview.text = overview
        imgImageView.image = nil
        if let data = imageData {
            imgImageView.image = UIImage(data: data)        }
        
    }
    
}
