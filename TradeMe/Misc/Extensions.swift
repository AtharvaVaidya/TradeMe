//
//  Extensions.swift
//  Movies
//
//  Created by Atharva Vaidya on 14/07/18.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

public extension Dictionary where Key == String, Value == Any?
{
    
    /// Encode a dictionary as url encoded string
    ///
    /// - Parameter base: base url
    /// - Returns: encoded string
    /// - Throws: throw `.dataIsNotEncodable` if data cannot be encoded
    public func urlEncodedString(base: String = "") throws -> String
    {
        guard self.count > 0 else { return "" } // nothing to encode
        let items: [URLQueryItem] = self.compactMap { (key,value) in
            guard let v = value else { return nil } // skip item if no value is set
            return URLQueryItem(name: key, value: String(describing: v))
        }
        var urlComponents = URLComponents(string: base)!
        urlComponents.queryItems = items
        guard let encodedString = urlComponents.url else {
            throw NetworkError.dataIsNotEncodable(self)
        }
        return encodedString.absoluteString
    }
    
}

public extension String
{
    /// Fill up a string by replacing values in specified placeholders
    ///
    /// - Parameter dict: dict to use
    /// - Returns: replaced string
    public func fill(withValues dict: [String: Any?]?) -> String {
        guard let data = dict else {
            return self
        }
        var finalString = self
        data.forEach { arg in
            if let unwrappedValue = arg.value {
                finalString = finalString.replacingOccurrences(of: "{\(arg.key)}", with: String(describing: unwrappedValue))
            }
        }
        return finalString
    }
    
    public func stringByAdding(urlEncodedFields fields: ParamsDict?) throws -> String {
        guard let f = fields else { return self }
        return try f.urlEncodedString(base: self)
    }
}

extension Collection
{
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element?
    {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIViewController
{
    func presentNotification(text: String, subText: String)
    {
        let alert = UIAlertController(title: text, message: subText, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showLoadingIndicator()
    {
        DispatchQueue.main.async
        {
            let superview: UIView = self.view.superview ?? self.view
            
            let activityIndicator = Factory.makeActivityIndicator(for: superview)
            
            superview.addSubview(activityIndicator)
            superview.bringSubview(toFront: activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    @objc func hideLoadingIndicator()
    {
        DispatchQueue.main.async
        {
            let superview: UIView = self.view.superview ?? self.view
            
            if let activityIndicator = superview.viewWithTag(-1001) as? UIActivityIndicatorView
            {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}

extension Array
{
    /// Returns an array containing this sequence shuffled
    var shuffled: Array
    {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array
    {
        let count = self.count
        indices.lazy.dropLast().forEach
        {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
