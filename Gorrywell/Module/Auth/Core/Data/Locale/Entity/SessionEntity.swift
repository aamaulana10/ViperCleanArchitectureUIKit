//
//  SessionEntity.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import RealmSwift

class SessionEntity: Object {
  
  @objc dynamic var id  = ""
  @objc dynamic var email  = ""
  @objc dynamic var dateOfBirth = ""
  @objc dynamic var activityLevel = ""
  @objc dynamic var gender = ""
  @objc dynamic var s3ImagePath = ""
  @objc dynamic var phoneNumber = ""
  @objc dynamic var name: Name?
  @objc dynamic var dietGoal: DietGoal?
  @objc dynamic var bloodType = ""
  @objc dynamic var isPremium = false
  @objc dynamic var emailVerified = false
  @objc dynamic var phoneNumberVerified = false
  @objc dynamic var hasPassword = false
  @objc dynamic var activityGrade = ""
  @objc dynamic var corporateId: CorporateId?
  @objc dynamic var token = ""
  
  override static func primaryKey() -> String? {
    
      return "id"
  }
}

class DietGoal: Object {
    @objc dynamic var id  = ""
    @objc dynamic var name = ""
    @objc dynamic var topic = ""
    @objc dynamic var score =  0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Name: Object {
    @objc dynamic var first  = ""
    @objc dynamic var last = ""
    
}

class CorporateId: Object {
    @objc dynamic var id = ""
    @objc dynamic var corporate_name = ""
    @objc dynamic var corporate_code = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
