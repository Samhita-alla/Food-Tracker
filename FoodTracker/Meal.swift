//
//  Meal.swift
//  FoodTracker
//
//  Created by Samhita Reddy on 10/03/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class Meal : NSObject,NSCoding{
    //Mark:properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: archiving paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK:types
    
    struct PropertKey{
        static let name="name"
        static let photo="photo"
        static let rating="rating"
    }
    
    //MARK:INITIALISATION
    
    
    init?(name: String,photo: UIImage?,rating: Int){
        
        //the name must not be empty
        guard !name.isEmpty else
        {   return nil}
        
        //the rating must be betn 0 and 5 inclusively
        guard (rating>=0) && (rating<=5) else{
            return nil
        }
        
        //initialise stored properties
        self.name=name
        self.photo=photo
        self.rating=rating
    }
    
    //MARK:NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertKey.name)
        aCoder.encode(photo, forKey: PropertKey.photo)
        aCoder.encode(rating,forKey: PropertKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        //the name is required. if we cannot decode a name string,the initialiser shld fail
        guard let name = aDecoder.decodeObject(forKey: PropertKey.name) as? String else{
            os_log("unable to decode the name for a meal object",log: OSLog.default,type: .debug)
            return nil
        }
        
        //becoz photo is an optional property of meal, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertKey.rating)
        
        //must call designed initialiser
        self.init(name: name,photo: photo,rating: rating)
    }
}
