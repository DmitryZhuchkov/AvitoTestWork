//
//  ServiceCell.swift
//  AvitoTestWork
//
//  Created by Дмитрий Жучков on 13.01.2021.
//

import Foundation
import UIKit
class ServiceCell: UICollectionViewCell {
    
    static let reuseId = "ServiceCell"
    // MARK: Adding Elements
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var PriceLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      label.numberOfLines = 0
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    var ServiceImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var CheckImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: Name constraints
        addSubview(nameLabel)
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 100).isActive = true
        
        // MARK: Description constraints
        addSubview(smallDescriptionLabel)
        smallDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
        smallDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        smallDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -75).isActive = true
        // MARK: Price constraints
        addSubview(PriceLabel)
        PriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
        PriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15).isActive = true
        PriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        // MARK: Image constraints
        addSubview(ServiceImage)
        ServiceImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        ServiceImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        // MARK: Check Image constraints
        addSubview(CheckImage)
        CheckImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25).isActive = true
        CheckImage.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
        backgroundColor = .white
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
