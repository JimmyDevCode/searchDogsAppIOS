//
//  HomeViewDetailController.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/08/23.
//

import UIKit
import SDWebImage

protocol HomeViewDetailProtocol: AnyObject{
    
    func updateDetailDog(detailDog: DogMapperResponse)
}


class HomeViewDetailController: UIViewController {

    var dogDetail: DogMapperResponse?
    var presenter: HomeDetailPresenterprotocol?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var imageViewDog: UIImageView!
    
    //detail background
    @IBOutlet weak var backGroundWeight: UIView!
    @IBOutlet weak var backGroundHeight: UIView!
    @IBOutlet weak var backGroundLifeSpan: UIView!
    @IBOutlet weak var backGroundOrigin: UIView!
    
    @IBOutlet weak var backGroundIconWeight: UIView!
    @IBOutlet weak var backGroundIconHeight: UIView!
    @IBOutlet weak var backGroundIconLifeSpan: UIView!
    @IBOutlet weak var backGroundIconOrigin: UIView!
    
    @IBOutlet weak var imagenIconWeight: UIImageView!
    @IBOutlet weak var imagenIconHeight: UIImageView!
    @IBOutlet weak var imagenIconLifeSpan: UIImageView!
    @IBOutlet weak var imagenIconOrigin: UIImageView!
    
    @IBOutlet weak var lifeSpanLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var breedGroupLabel: UILabel!
    
    @IBOutlet weak var temperamentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getDetail()
        
    }
}

extension HomeViewDetailController: HomeViewDetailProtocol {
    func updateDetailDog(detailDog: DogMapperResponse) {
        self.dogDetail = detailDog
        DispatchQueue.main.async {
            self.updateDetail()
        }
    }
    
    private func updateDetail(){
        
        if let dogDetail = dogDetail {
            self.nameLabel.text = dogDetail.name
            self.breedLabel.text = dogDetail.bredFor
            
           
            if let imageURL = URL(string: dogDetail.url){
                imageViewDog.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
            }else {
                imageViewDog.image = UIImage(named: "placeholder")
                
            }
            self.lifeSpanLabel.text = dogDetail.lifeSpan
            self.weightLabel.text = dogDetail.weight
            self.heightLabel.text = dogDetail.height
            self.temperamentLabel.text = dogDetail.temperament
            self.breedGroupLabel.text = dogDetail.breedGroup
        }
        setupCornerRadius()
        setupIconImage()
       
    }
}

extension HomeViewDetailController {
    
    func setupCornerRadius(){
        backGroundWeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundLifeSpan.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundHeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundOrigin.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        
        backGroundIconWeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundIconLifeSpan.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundIconHeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        backGroundIconOrigin.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 15)
        
        imagenIconWeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 10)
        imagenIconLifeSpan.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 10)
        imagenIconHeight.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 10)
        imagenIconOrigin.roundCorners([.topLeft,.topRight,.bottomRight,.bottomLeft], radius: 10)
        
    }
    
    func setupIconImage() {
        imagenIconLifeSpan.image = UIImage(systemName: "heart")
        imagenIconWeight.image = UIImage(systemName: "scalemass")
        imagenIconHeight.image = UIImage(systemName: "ruler")
        imagenIconOrigin.image = UIImage(systemName: "rectangle.3.group")
    }
}
