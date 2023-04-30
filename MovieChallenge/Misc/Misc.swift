//
//  ImageCache.swift
//  MovieChallenge
//
//  Created by Corry Timothy on 30/4/2023.
//

import Foundation
import UIKit
import Combine

extension String {
    func localise() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
    
    func makeStringToLowerBound(s: String?, lowerBound: String.Index) -> String {
        return String(s?[..<lowerBound] ?? "")
    }
    // this is probably better as it takes in the range and creates the String.Index
    func makeStoLowerBoundRange(s: String?, lowerbound: String) -> String {
        if let range = s?.range(of: lowerbound) {
            return String(s?[..<range.lowerBound] ?? "")
        } else { return "" }
    }
    
    func makeStringBetween(s: String, A: Int, B: Int) -> String {
        if s.count > B {
            return String(s[s.index(s.startIndex, offsetBy: A)...s.index(s.startIndex, offsetBy: B)])
        } else { return "" }
    }
    
    func SReFormatDate(s: String, form1: DateFormatter, form2: DateFormatter) -> String {
        if let date = form1.date(from: s) {
            return form2.string(from: date)
        } else { return s }
    }
}

extension Date {
    func DateFromString(s: String, form: DateFormatter) -> Date {
        if let date = form.date(from: s) {
            return date
        } else { return Date() }
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
extension UIColor {
    static let myRed = UIColor(r: 212, g: 1, b: 25)               // #d40119
    static let myGray1 = UIColor(r: 236, g: 236, b: 228)          // #727272
    static let myBorder = UIColor(r: 224, g: 224, b: 224)         // #e0e0e0
    static let myGrayText1 = UIColor(r: 185, g: 188, b: 185)      // #b9bcb9
    static let myBlue = UIColor(r: 0, g: 72, b: 183)              // #0048b7
    static let myGrayText2 = UIColor(r: 118, g: 118, b: 118)      // #767676
    static let myBackgroundColor = UIColor(r: 250, g: 250, b: 250)// #fafafa
    static let myMainBackground = UIColor(r: 226, g: 227, b: 227)
}


enum AsyncError: Error {
    case message(String)
}

func makeStringBetween(s: String, A: Int, B: Int) -> String {
    if s.count > B {
        return String(s[s.index(s.startIndex, offsetBy: A)...s.index(s.startIndex, offsetBy: B)])
    } else { return "" }
}

func makeStoLowerBoundRange(s: String?, lowerbound: String) -> String {
    if let range = s?.range(of: lowerbound) {
        return String(s?[..<range.lowerBound] ?? "")
    } else { return "" }
}

class tableCustom: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUpTable()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTable()
    }
    func setUpTable() {
        layer.zPosition = 1
        backgroundColor = UIColor.myBackgroundColor
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = UITableViewCell.SeparatorStyle.none
        showsVerticalScrollIndicator = false
    }
}

extension String {
    
    func ifLet(s: String?) -> String {
        if let s = s {
            return s
        } else { return "" }
    }
    func ifLetItS(i: Int?) -> String {
        if let i = i {
            return String(i)
        } else { return "" }
    }
    
    func sDoubleToString(d: Double?) -> String {
        if let d = d {
            return String(d)
        } else { return "" }
    }
    
    func sReFormatDate(s: String, form1: DateFormatter, form2: DateFormatter) -> String {
        if let date = form1.date(from: s) {
            return form2.string(from: date)
        } else { return "" }
    }
    
}

extension Bool {
    func ifLetBool(s: Bool?) -> Bool {
        if let s = s {
            return s
        } else { return false }
    }
}

extension DateFormatter {
    func format(s: String) -> DateFormatter {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = s
        return dateFormatter
    }
}
