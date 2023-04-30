//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//


import UIKit

class MovieDetailsCell: UITableViewCell {
    var MovieListTable: MovieDetailsCell?
    var data: flightViewModelStruct! {
        didSet {
            MovieTitle.text = data.MovieTitle
            Desc.text = data.Description
            LanguageTitle.text = data.OriginalLanguage
            AverageRating.text = data.rating
            ReleaseDate.text = data.releasedDate
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        BackGroundMovieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        BackGroundMovieImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        BackGroundMovieImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        BackGroundMovieImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        MovieImage.topAnchor.constraint(equalTo: BackGroundMovieImage.bottomAnchor, constant: -40).isActive = true
        MovieImage.leftAnchor.constraint(equalTo: BackGroundMovieImage.leftAnchor, constant: 10).isActive = true
        MovieImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        MovieImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        MovieTitle.topAnchor.constraint(equalTo: BackGroundMovieImage.bottomAnchor, constant: 5).isActive = true
        MovieTitle.leftAnchor.constraint(equalTo: MovieImage.rightAnchor, constant: 10).isActive = true
        MovieTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
        
        Released.topAnchor.constraint(equalTo: MovieTitle.bottomAnchor, constant: 15).isActive = true
        Released.leftAnchor.constraint(equalTo: MovieTitle.leftAnchor, constant: 5).isActive = true
        Released.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        ReleaseDate.topAnchor.constraint(equalTo: MovieTitle.bottomAnchor, constant: 15).isActive = true
        ReleaseDate.leftAnchor.constraint(equalTo: Released.rightAnchor, constant: 2).isActive = true
        ReleaseDate.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        LanguageLabel.topAnchor.constraint(equalTo: Released.bottomAnchor, constant: 0).isActive = true
        LanguageLabel.leftAnchor.constraint(equalTo: MovieTitle.leftAnchor, constant: 5).isActive = true
        LanguageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        LanguageTitle.topAnchor.constraint(equalTo: Released.bottomAnchor, constant: 0).isActive = true
        LanguageTitle.leftAnchor.constraint(equalTo: LanguageLabel.rightAnchor, constant: 0).isActive = true
        LanguageTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        RatingLabel.topAnchor.constraint(equalTo: LanguageLabel.bottomAnchor, constant: 0).isActive = true
        RatingLabel.leftAnchor.constraint(equalTo: LanguageLabel.leftAnchor, constant: 0).isActive = true
        RatingLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        AverageRating.topAnchor.constraint(equalTo: LanguageLabel.bottomAnchor, constant: 0).isActive = true
        AverageRating.leftAnchor.constraint(equalTo: RatingLabel.rightAnchor, constant: 0).isActive = true
        AverageRating.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        StarImage.topAnchor.constraint(equalTo: LanguageLabel.bottomAnchor, constant: 5).isActive = true
        StarImage.leftAnchor.constraint(equalTo: AverageRating.rightAnchor, constant: 0).isActive = true
        StarImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        StarImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        Overview.topAnchor.constraint(equalTo: AverageRating.bottomAnchor, constant: 30).isActive = true
        Overview.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        Desc.topAnchor.constraint(equalTo: Overview.bottomAnchor, constant: 5).isActive = true
        Desc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35).isActive = true
        Desc.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35).isActive = true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        addSubview(BackGroundMovieImage)
        addSubview(MovieImage)
        addSubview(MovieTitle)
        addSubview(LanguageLabel)
        addSubview(LanguageTitle)
        addSubview(StarImage)
        addSubview(RatingLabel)
        addSubview(AverageRating)
        addSubview(ReleaseDate)
        addSubview(Released)
        addSubview(Overview)
        addSubview(Desc)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var MovieTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 4
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.text = "MOVIE TITLE"
        label.backgroundColor = UIColor.clear
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
    
    var LanguageLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "Langauge: "
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var LanguageTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "Langauge Not Found"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var AverageRating: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "9.5"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var RatingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "User rating: "
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var ReleaseDate: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "15/05/20"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var Released: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.text = "Release Date:"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var Rated: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        label.textColor = UIColor.gray
        label.text = "Audience rating"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var Overview: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.text = "Overview"
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    var Desc: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(gray: 0, alpha: 0)
        return label
    }()
    
    let MovieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(named: "TestImage")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.layer.zPosition =  1
        imageView.layer.cornerRadius = 7.5
        return imageView
    }()
    
    let BackGroundMovieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.zPosition = 1
        return imageView
    }()
    
    let AdultWarining: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(named: "TestAdultWarning")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition =  3
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
