//
//  FavoritesViewController.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBackground
        tableView.registerCelNib(cellClass: BookTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    var favoritePresenter: FavoritePresenterProtocol = FavoritePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(favoritePresenter.getFavorites())
        getBooks()
    }
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func getBooks() {
        favoritePresenter.readBooks()
        favoritePresenter.reloadUI = { [weak self] in
            guard let self else { return }
            self.tableView.reloadData()
        }
    }
    
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(favoritePresenter.getFavorites().count)
        return favoritePresenter.getFavorites().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BookTableViewCell.self), for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        let book = favoritePresenter.getFavorites()[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = favoritePresenter.getFavorites()[indexPath.row]
        let bookDetailsPresenter = BookDetailsPresenter(item: book)
        let bookDetailsViewController = BookDetailsViewController(bookDetailsPresenter: bookDetailsPresenter)
        self.navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("delete")
        let book = favoritePresenter.getFavorites()[indexPath.row]
        favoritePresenter.deleteBooks(book: book)
        
    }
}
