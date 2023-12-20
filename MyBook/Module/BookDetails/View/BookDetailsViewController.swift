//
//  BookDetailsViewController.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import UIKit
import Cosmos
import SafariServices

final class BookDetailsViewController: UIViewController {

    @IBOutlet private weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var bookImage: UIImageView!{
        didSet {
            bookImage.clipsToBounds = true
            bookImage.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var cosmosStarsView: CosmosView!{
        didSet {
            cosmosStarsView.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet private weak var bookTitleLabel: UILabel!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var authorLabel: UILabel!
    
    @IBOutlet private weak var bookDetailsLabel: UILabel!
    
    @IBOutlet private weak var blisherNameLabel: UILabel!
    
    @IBOutlet private weak var publisherDate: UILabel!
    
    @IBOutlet private weak var numberPagesLabel: UILabel!
    
    @IBOutlet private weak var categoryLabel: UILabel!
    
    @IBOutlet private weak var readItButton: UIButton! {
        didSet {
            DesignSystem.AppButtonStyle.label.apply(to: readItButton, title: "Read it.")
            readItButton.backgroundColor = DesignSystem.AppColors.border.color
        }
    }
    var bookDetailsPresenter: BookDetailsPresenterProtocol
    let heartButton = UIButton(type: .custom)

    
    init( bookDetailsPresenter: BookDetailsPresenterProtocol ) {
        self.bookDetailsPresenter = bookDetailsPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        assignData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addFavouriteButton()
        heartButton.isSelected  = bookDetailsPresenter.isBookInFavorite()
    }
    
    
    private func addFavouriteButton() {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            heartButton.tintColor = UIColor.red
            heartButton.addTarget(self, action: #selector(toggleFavourite), for: .touchUpInside)
            let heartBarButtonItem = UIBarButtonItem(customView: heartButton)
            navigationItem.rightBarButtonItem = heartBarButtonItem
        }
        
    @objc func toggleFavourite(sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            bookDetailsPresenter.addToRealm()
        } else {
            bookDetailsPresenter.deleteBooks()
        }
    }

    func assignData() { 
        let item = bookDetailsPresenter.getItem()
       let image = bookDetailsPresenter.hanldeSecureImage()
                    backgroundImage.setImage(imagePath: image, placeholderImage: UIImage(named: "No-Cover"))
                    bookImage.setImage(imagePath: image, placeholderImage: UIImage(named: "No-Cover"))
        bookTitleLabel.text = item.title
        titleLabel.text = item.title
        cosmosStarsView.rating = item.ratingsCount
        authorLabel.text = bookDetailsPresenter.getAuthor()
        bookDetailsLabel.text = item.description
        blisherNameLabel.text = "Publisher Name: \(item.publisherName)"
        publisherDate.text = "Publisher Date: \(item.publisherDate)"
        numberPagesLabel.text = "Number Pages: \(item.pageCount)"
        categoryLabel.text = "Category: \(bookDetailsPresenter.getCategory())"
    }
    


    @IBAction func readItButton(_ sender: Any) {
        print("web")
        if let url = bookDetailsPresenter.getItem().previewLink.encodeUrl().asURL {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }

    }
}
