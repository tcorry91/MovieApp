//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import UIKit
import Combine
import Foundation

class MainViewVC: UIViewController {
    
    private var usersSubscriper: AnyCancellable?
    var data0 = [flightViewModelStruct]()
    var data1 = [flightViewModelStruct]()
    var listOfFlights = [flightStruct]()
    var tableView = tableCustom()
    var store = Set<AnyCancellable>()
    let clean = Transform()
    var PassArray = [""]
    let mainViewCellID = "mainViewCellID"
    var mainCor: MainCoordinator
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.title = "Movies"
        setUpTableViewDetails()
        setUpTableView()
        setUpTextFieldPublisher()
    }
    var TickedItems = [Character]()
    var whatWasTicked = ""
    func callFailureAlert() {
        print("Failure Alert Called")
    }
    
    @objc func apiCall(text: String) {
        print("api call starting")
        usersSubscriper = callAPIPublisher(text: text)
            .sink(receiveCompletion: { finished in
                switch finished {
                case .failure(let error): print("ApCall error:", error)
                case .finished: print("success")
                }
            }, receiveValue: { (data) in
                self.refactorData(data: data)
            })
    }
    func callAPIPublisher<T: Codable>(text: String) -> AnyPublisher<T, Error> {
        var url = URL(string: "\(Constraints.urlString)\(Constraints.apiKey)&query=\(text)")!
        return DataManagerGenerics().apiCallGeneric(url: url, text: text)
    }
    func refactorData(data: flightStruct) {
        clean.refactorAndInsertIntoViewModel(data: data).sink { [weak self] completion in
            switch completion {
            case .failure(.message(let error)): self?.callFailureAlert()
            case .finished:  print("case.finished")
            }
        } receiveValue: { (data) in
            self.data0 = data;
            self.data1 = self.data0
            DispatchQueue.main.async {
                self.tableView.reloadData();
                self.tableView.tableFooterView = UIView()
            }
        }.store(in: &store)
    }
    func changeState(type: FlightSearch) {
        searchType = type
        changedState()
    }
    func changedState() {
        self.generalTextField.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.textInput(text: "", type: self.searchType)
            self.tableView.reloadData()
        }
    }
    var searchType: FlightSearch = .departure
    func setUpTextFieldPublisher() {
        generalTextField.textPublisher.sink { value in
            self.textInput(text: value)
        }.store(in: &cancellables)
        
    }
    func textInput(text: String) {
        if text == "" { clearText(); return }
        var t = text.replacingOccurrences(of: " ", with: "+")
        DispatchQueue.main.async {
            self.apiCall(text: t)
        }
    }
    
    func textInput(text: String, type: FlightSearch) {
        switch type {
        case .departure:
            let searchResults = data1.filter { $0.MovieTitle!.contains(text) }
            text.count < 1 ? update(type: .original, data: []) : update(type: .search, data: searchResults)
        case .arrival:
            let searchResults = data1.filter { $0.MovieTitle!.contains(text) }
            text.count < 1 ? update(type: .original, data: []) : update(type: .search, data: searchResults)
        }
    }
    
    func update(type: DataType, data: [flightViewModelStruct]) {
        switch type {
        case .search:
            DispatchQueue.main.async { self.data0 = data; self.tableView.reloadData() }
        case .original:
            DispatchQueue.main.async { self.data0 = self.data1; self.tableView.reloadData() }
        }
    }
    enum FlightSearch  {
        case arrival
        case departure
    }
    enum DataType  {
        case search
        case original
    }
    
    lazy var searchBarBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        let color = UIColor.gray
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var searchWhiteBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        let color = UIColor.gray
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    lazy var searchTextField: UITextView = {
        let label = UITextView()
        label.textColor = UIColor.black
        label.isHidden = false
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        label.font = UIFont(name: "Arial", size: 16.5)
        label.textAlignment = NSTextAlignment.left
        label.returnKeyType = .done
        label.textContainer.maximumNumberOfLines = 1
        return label
    }()
    lazy var xForSearchImage: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "clear"), for: .normal)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.layer.zPosition = 2
        return button
    }()
    @objc func clearText() {
        self.generalTextField.text = ""
        DispatchQueue.main.async {
            self.data0 = []
            self.tableView.reloadData()
        }
    }
    let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        return imageView
    }()
    
    let EmptySearch: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "magnifyingglass.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        return imageView
    }()
    
    var cancellables = Set<AnyCancellable>()
    
    lazy var generalTextField: UITextField = {
        let field = UITextField()
        field.placeholder = ""
        field.backgroundColor = .clear
        field.autocapitalizationType = UITextAutocapitalizationType.none
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.zPosition = 2
        field.textColor = UIColor.black
        field.attributedPlaceholder = NSAttributedString(string: "Search Movies..", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.font = UIFont(name: "Arial", size: 15)
        field.textAlignment = NSTextAlignment.left
        field.returnKeyType = .done
        field.keyboardType = .numberPad
        field.keyboardAppearance = .light
        return field
    }()
}
