//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import UIKit

class MainViewCell: UITableViewCell {
    var MovieListTable: MainViewVC?
    var data: flightViewModelStruct! {
        didSet {
            MovieTitle.text = data.MovieTitle
            AverageRating.text = data.rating
            LanguageTitle.text = data.OriginalLanguage
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        MovieTitle.topAnchor.constraint(equalTo: MovieImage.topAnchor, constant: 0).isActive = true
        MovieTitle.leftAnchor.constraint(equalTo: MovieImage.rightAnchor, constant: 10).isActive = true
        MovieTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        LanguageType.topAnchor.constraint(equalTo: StarImage.bottomAnchor, constant: 5).isActive = true
        LanguageType.leftAnchor.constraint(equalTo: MovieTitle.leftAnchor, constant: 0).isActive = true
        LanguageType.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        LanguageTitle.topAnchor.constraint(equalTo: StarImage.bottomAnchor, constant: 5).isActive = true
        LanguageTitle.leftAnchor.constraint(equalTo: LanguageType.rightAnchor, constant: 2).isActive = true
        LanguageTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        AverageRating.topAnchor.constraint(equalTo: MovieTitle.bottomAnchor, constant: 5).isActive = true
        AverageRating.leftAnchor.constraint(equalTo: StarImage.rightAnchor, constant: 5).isActive = true
        AverageRating.widthAnchor.constraint(equalToConstant: 45).isActive = true
        AverageRating.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        AdultWarining.topAnchor.constraint(equalTo: LanguageTitle.bottomAnchor, constant: 5).isActive = true
        AdultWarining.heightAnchor.constraint(equalToConstant: 15).isActive = true
        AdultWarining.widthAnchor.constraint(equalToConstant: 65).isActive = true
        AdultWarining.leftAnchor.constraint(equalTo: MovieTitle.leftAnchor, constant: 0).isActive = true
        
        MovieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        MovieImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        MovieImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        MovieImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        StarImage.topAnchor.constraint(equalTo: MovieTitle.bottomAnchor, constant: 5).isActive = true
        StarImage.leftAnchor.constraint(equalTo: MovieTitle.leftAnchor, constant: 0).isActive = true
        StarImage.widthAnchor.constraint(equalToConstant: 22).isActive = true
        StarImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        addSubview(MovieTitle)
        addSubview(MovieImage)
        addSubview(LanguageTitle)
        addSubview(AverageRating)
        addSubview(AdultWarining)
        addSubview(StarImage)
        addSubview(LanguageType)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var MovieTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        label.textColor = UIColor.gray
        label.text = "Title Not Found"
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let StarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition =  3
        return imageView
    }()
    
    var LanguageTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        label.textColor = UIColor.gray
        label.text = "English"
        label.backgroundColor = UIColor.white
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var LanguageType: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        label.textColor = UIColor.gray
        label.text = "Language:"
        label.backgroundColor = UIColor.white
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var AverageRating: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        label.textColor = UIColor.gray
        label.text = "Rating Not Found"
        label.backgroundColor = UIColor.white
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let MovieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(named: "TestImage")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition =  3
        return imageView
    }()
    
    var AdultWarining: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        label.textColor = UIColor.red
        label.text = "Adult"
        label.backgroundColor = UIColor.white
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}




