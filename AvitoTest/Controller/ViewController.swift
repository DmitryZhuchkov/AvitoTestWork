//
//  ViewController.swift
//  AvitoTestWork
//
//  Created by Дмитрий Жучков on 12.01.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let data = JsonLoad().resultData
    var ServiceCollectionView:UICollectionView?
    var selectedService = ""
    // MARK: Adding Elements
    lazy var Choice: ButtonModel = {
        let button = ButtonModel(title: String((data?.result.selectedActionTitle)!))
        button.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
       return button
    }()
    lazy var TopLabel: LabelModel = {
        let label = LabelModel(title: String((data?.result.title)!))
        return label
    }()
    let closeButton: UIButton = {
        let button = UIButton()
        if let image = UIImage(named: "CloseIconTemplate.pdf") {
            button.setImage(image, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
     }()
    let checkImage: UIImageView = {
        let imageview = UIImageView()
        if let image = UIImage(named: "checkmark.pdf") {
            imageview.image = image
        }
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
     }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Button constraints
        view.addSubview(Choice)
        Choice.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30).isActive = true
        Choice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        Choice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        // MARK: Label
        view.addSubview(TopLabel)
        TopLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        TopLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        TopLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4, constant: 5).isActive = true
        // MARK: CollectionView constraints
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        ServiceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let ServiceCollectionView = ServiceCollectionView else {
            return
        }
        ServiceCollectionView.register(ServiceCell.self, forCellWithReuseIdentifier: "ServiceCell")
        ServiceCollectionView.dataSource = self
        ServiceCollectionView.delegate = self
        ServiceCollectionView.backgroundColor = .none
        ServiceCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ServiceCollectionView)
        ServiceCollectionView.topAnchor.constraint(equalTo: TopLabel.bottomAnchor,constant: 1).isActive = true
        ServiceCollectionView.bottomAnchor.constraint(equalTo: Choice.topAnchor,constant: -30).isActive = true
        ServiceCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        ServiceCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        // MARK: Close Template constraints
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.topAnchor,constant:60).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: TopLabel.topAnchor,constant: -10).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.result.list.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as? ServiceCell
        cell?.nameLabel.text = data?.result.list[indexPath.row].title
        cell?.smallDescriptionLabel.text = data?.result.list[indexPath.row].listDescription
        cell?.PriceLabel.text = data?.result.list[indexPath.row].price
        let urlString = data?.result.list[indexPath.row].icon.the52X52
        let url = URL(string: urlString!)!
        DataProvider.Cache.downloadImage(url: url) { image in
            cell?.ServiceImage.image = image
        }
        cell!.backgroundColor = #colorLiteral(red: 0.949755013, green: 0.949913919, blue: 0.9497340322, alpha: 1)
        return cell!
    }
    // MARK: Collection View Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = ServiceCollectionView?.cellForItem(at: indexPath) as? ServiceCell
        if   (cell?.CheckImage.image == checkImage.image) {
            cell?.CheckImage.image = .none
            selectedService = ""
        } else {
            cell?.CheckImage.image = checkImage.image
            selectedService = (data?.result.list[indexPath.row].title)!
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = ServiceCollectionView?.cellForItem(at: indexPath) as? ServiceCell
        selectedService = ""
        cell?.CheckImage.image = .none
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 1)
    }
    @objc fileprivate func ButtonTapped() {
        if (selectedService == nil) {
       let alert = UIAlertController( title: "", message: "Ошибка", preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
       }
        if (selectedService != "") {
            let alert = UIAlertController( title: "", message: selectedService, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController( title: "", message: "Вы ничего не выбрали", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


