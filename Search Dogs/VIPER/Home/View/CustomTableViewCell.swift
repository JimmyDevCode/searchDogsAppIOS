//
//  CustomTableViewCell.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dogImagenView: UIImageView!
    @IBOutlet weak var breeNameLabel: UILabel!
    @IBOutlet weak var breedGroupLabel: UILabel!
    @IBOutlet weak var backgroundCustomViewCell: UIView!

    
    func setup(dog: DogMapperResponse) {
        
        backgroundCustomViewCell.roundCorners([.topLeft,.bottomLeft,.topRight,.bottomRight], radius: 15)
   
        backgroundCustomViewCell.addShadow(shadowColor: .black, shadowOpacity: 0.1, shadowOffset: CGSize(width: 0, height: 2), shadowRadius: 0.2)
        
        breeNameLabel.text = dog.name
        breedGroupLabel.text = dog.bredFor
        
        if let imageURL = URL(string: dog.url){
            dogImagenView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
            dogImagenView.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        }else {
            dogImagenView.image = UIImage(named: "placeholder")
            
        }
    }
}
