//
//  ViewController.swift
//  Green-Bean-Mobile
//
//  Created by Maurice Matthew on 2021-03-06.
//  Copyright © 2021 MauriceMatthewDesign. All rights reserved.
//

import UIKit


struct CustomData {
    var title: String
    var image: UIImage
    var url: String
    
}

class ViewController: UIViewController {
    
    let data = [
    
        CustomData(title: "recipes", image: #imageLiteral(resourceName: "Recipe-Card-stock-1"), url: "maxcodes.io/courses"),
        CustomData(title: "recipes", image: #imageLiteral(resourceName: "Recipe-Card-portion-1"), url: "google.com"),
        CustomData(title: "recipes", image: #imageLiteral(resourceName: "Recipe-Card-stock-1"), url: "maxcodes.io/courses"),
        CustomData(title: "recipes", image: #imageLiteral(resourceName: "Recipe-Card-stock-1"), url: "maxcodes.io/courses"),
        CustomData(title: "recipes", image: #imageLiteral(resourceName: "Recipe-Card-stock-1"), url: "maxcodes.io/courses"),

    ]
    

    fileprivate let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true

        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1).isActive = true
        
 


        collectionView.delegate = self
        collectionView.dataSource=self
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
}


class CustomCell: UICollectionViewCell {
    
    
    var data: CustomData? {
        didSet{
            guard let data = data else{return}
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Recipe-Card-portion-1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//let url: "";
