//
//  HomeViewController.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet private weak var homeBackgroundView: UIView! {
        didSet {
            homeBackgroundView.backgroundColor = DesignSystem.AppColors.background.color
        }
    }
    @IBOutlet private weak var TitleLabel: UILabel! {
        didSet {
            TitleLabel.font = DesignSystem.AppTypography.title.font
            TitleLabel.textColor = DesignSystem.AppColors.background.color
        }
    }
    
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = DesignSystem.AppColors.primary.color
            containerView.addBottomRoundedEdge(desiredCurve: 2)
            
            
        }
    }
    
    @IBOutlet private weak var bookCoverImage: UIImageView! {
        didSet {
            bookCoverImage.image = UIImage(named: "bookR")
            bookCoverImage.clipsToBounds = true
            bookCoverImage.layer.cornerRadius = 10
        }
    }
    
    
    @IBOutlet private weak var searchButton: UIButton! {
        didSet {
            DesignSystem.AppButtonStyle.label.apply(to: searchButton, title: "Search")
            searchButton.backgroundColor = DesignSystem.AppColors.border.color
        }
    }
    
    
    @IBOutlet private weak var textContainerView: UIView! {
        didSet {
            textContainerView.cornerRadius = 10
        }
    }
    
    @IBOutlet private weak var searchTextField: UITextField!
    
    let swiftMessage = SwiftMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSwiftMessage()
    }
    
    deinit {
        ConnectionManger.shared.deInitObserve()
    }
    
    func showSwiftMessage() {
        ConnectionManger.shared.checkConnection()
        ConnectionManger.shared.showBackGroundView = { [weak self] show in
            guard let self = self else { return }
            switch show {
            case true:
                self.swiftMessage.swiftMessage(title: "Success", body: Connection.Reachable.rawValue, color: .success, layout: .messageView, style: .top)
            case false:
                self.swiftMessage.swiftMessage(title: "Failure", body: Connection.NotReachable.rawValue, color: .error, layout: .messageView, style: .top)
            }
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {

        guard let searched = searchTextField.text else { return  self.displayAlert(message: "Enter your Book", vc: self) }
        
       let homePresenter: HomePresenterProtocol = HomePresenter(search: searched)
        
         let search = homePresenter.removeLeadingTrailingSpacesAndNewlines(searched)
        
        if !search.isEmpty {
            let bookListVC = BookListViewController(bookListPresenter: BookListPresenter(search: search))
            self.navigationController?.pushViewController(bookListVC, animated: true)
        }
     
    }
    
}
