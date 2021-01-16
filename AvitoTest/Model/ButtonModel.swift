//
//  ButtonModel.swift
//  AvitoTestWork
//
//  Created by Дмитрий Жучков on 12.01.2021.
//

import UIKit
class ButtonModel: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
