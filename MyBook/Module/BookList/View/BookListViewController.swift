//
//  BookListViewController.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import UIKit

protocol BookListViewControllerProtocol: AnyObject {
    func viewControllerWillShowBackGround(_ presenter: BookListPresenter, show: Bool)
    func collectionWillShowBackGroundView(_ presenter: BookListPresenter)
    func viewControllerWillReloadUI(_ presenter: BookListPresenter)
}

final class BookListViewController: UIViewController {
    
    @IBOutlet private weak var booksCollectionView: UICollectionView! {
        didSet {
            booksCollectionView.registerCelNib(cellClass: BookListCollectionViewCell.self)
            booksCollectionView.dataSource = self
            booksCollectionView.delegate = self
        }
    }
    
    var bookListPresenter: BookListPresenterProtocol
    
    init(bookListPresenter: BookListPresenterProtocol) {
        self.bookListPresenter = bookListPresenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
        fireClosure()
//        showCollectionBackGroundView()
//        reloadUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bookListPresenter.showBackGroundView()
    }
    
    private func getBooks() {
        ActivityIndicator.shared.setUpIndicator(view: view)
        bookListPresenter.fetchBooks()
       // stopIndicator()
    }
    
    private func fireClosure() {
        stopIndicator()
        showCollectionBackGroundView()
        reloadUI()
    }
    
    private func stopIndicator() {
        bookListPresenter.stopIndicator = {
            ActivityIndicator.shared.indicator.stopAnimating()
        }
    }
    
    private func showCollectionBackGroundView() {
        bookListPresenter.showCollectionBackGround = { [weak self] in
            guard let self else { return }
            self.booksCollectionView.backgroundView?.isHidden = false
            self.booksCollectionView.backgroundView = NoData().NoDataImage
        }
    }
    
    private func reloadUI() {
        bookListPresenter.reloadUI = { [weak self] in
            guard let self else { return }
            self.booksCollectionView.backgroundView?.isHidden = true
            self.booksCollectionView.reloadData()
        }
    }
    
}
extension BookListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("num \(bookListPresenter.myBooks.count)")
        return bookListPresenter.myBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookListCollectionViewCell.self), for: indexPath) as? BookListCollectionViewCell else { return UICollectionViewCell() }
        let item = bookListPresenter.myBooks[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
extension BookListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3 - 10, height: 220)
        
    }
}
extension BookListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = bookListPresenter.myBooks[indexPath.row]
        let BookDetailsPresenter = BookDetailsPresenter(item: item)
        let BookDetailsVC = BookDetailsViewController(bookDetailsPresenter: BookDetailsPresenter)
        self.navigationController?.pushViewController(BookDetailsVC, animated: true)
    }
}
extension BookListViewController: BookListViewControllerProtocol {
    
    func viewControllerWillShowBackGround(_ presenter: BookListPresenter, show: Bool) {
        let connectionView = ConnectionView()
        if show {
            booksCollectionView.backgroundView = connectionView.connectionImage
        }else {
            booksCollectionView.backgroundView = nil
            
        }
    }
    
    func collectionWillShowBackGroundView(_ presenter: BookListPresenter) {
            self.booksCollectionView.backgroundView?.isHidden = false
            self.booksCollectionView.backgroundView = NoData().NoDataImage
    }
    
    func viewControllerWillReloadUI(_ presenter: BookListPresenter){
            self.booksCollectionView.reloadData()
    }
    
}
