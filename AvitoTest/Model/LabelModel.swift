//
//  LabelModel.swift
//  AvitoTestWork
//
//  Created by Дмитрий Жучков on 13.01.2021.
//
import UIKit
class LabelModel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = .clear
        text = title
        font = UIFont.systemFont(ofSize: 25, weight: .bold)
        numberOfLines = 3
        textColor = .black
        layer.cornerRadius = 8
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
