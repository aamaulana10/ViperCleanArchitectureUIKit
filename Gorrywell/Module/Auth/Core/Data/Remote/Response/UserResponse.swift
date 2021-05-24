//
//  UserResponse.swift
//  Gorrywell
//
//  Created by aamaulana10 on 08/04/21.
//

import Foundation

struct UserResponse: Codable {
  
  let data: UserModelDataResponse
  let status: String
  let statusCode: Int
  let message: String?
}

struct UserModelDataResponse: Codable {
  
  let token: String?
  let user: UserModelResponse
  
}

struct UserModelResponse: Codable {
  
  let id: String?
  let activityGrade: String?
  let activityLevel: String?
  let bloodType: String?
  let corporateId: CorporateIdResponse
  let dateOfBirth: String?
  let dietGoal: DietGoalResponse
  let email: String?
  let emailVerified: Bool?
  let gender: String?
  let hasPassword: Bool?
  let isPremium: Bool?
  let name: NameResponse
  let phoneNumber: String?
  let phoneNumberVerified: Bool?
  let s3ImagePath: String?
  
  enum CodingKeys: String, CodingKey {
    
    case id = "_id"
    case activityGrade = "activityGrade"
    case activityLevel = "activityLevel"
    case bloodType = "bloodType"
    case corporateId = "corporateId"
    case dateOfBirth = "dateOfBirth"
    case dietGoal = "dietGoal"
    case email = "email"
    case emailVerified = "emailVerified"
    case gender = "gender"
    case hasPassword = "hasPassword"
    case isPremium = "isPremium"
    case name = "name"
    case phoneNumber = "phoneNumber"
    case phoneNumberVerified = "phoneNumberVerified"
    case s3ImagePath = "s3ImagePath"
  }
}

struct NameResponse: Codable {
  
  let first: String?
  let last: String?
  
}

struct DietGoalResponse: Codable {
  
  let id: String?
  let name: String?
  let score: Int?
  let topic: String?
  
  enum CodingKeys: String, CodingKey {
    
    case id = "_id"
    case name = "name"
    case score = "score"
    case topic = "topic"
  }
  
}

struct CorporateIdResponse: Codable {
  
  let id: String?
  let kodePerusahaan: String?
  let namaPerusahaan: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case kodePerusahaan = "kode_perusahaan"
    case namaPerusahaan = "nama_perusahaan"
  }
  
}
