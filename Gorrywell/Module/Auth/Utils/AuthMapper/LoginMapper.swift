//
//  LoginMapper.swift
//  Gorrywell
//
//  Created by aamaulana10 on 08/04/21.
//

import Foundation
import RealmSwift

final class LoginMapper {
  
  static func mapLoginResponsesToDomains(
    input response: UserModelDataResponse
  ) -> UserModel {
    
      return UserModel(
        token: response.token,
        user: response.user)
  }
  
  static func mapLoginResponsesToEntities(
    input response: UserModel
  ) -> SessionEntity {
    
      let newSession = SessionEntity()
      
    newSession.id  = response.user.id ?? ""
    newSession.email  = response.user.email ?? ""
    newSession.dateOfBirth = response.user.dateOfBirth ?? ""
    newSession.activityLevel = response.user.activityLevel ?? ""
    newSession.gender = response.user.gender ?? ""
    newSession.s3ImagePath = response.user.s3ImagePath ?? ""
    newSession.phoneNumber = response.user.phoneNumber ?? ""
    newSession.name = mapNameResponseToEntity(input: response.user.name)
    newSession.dietGoal = mapDietGoalResponseToEntity(input: response.user.dietGoal)
    newSession.bloodType = response.user.bloodType ?? ""
    newSession.isPremium = response.user.isPremium ?? false
    newSession.emailVerified = response.user.emailVerified ?? false
    newSession.phoneNumberVerified = response.user.phoneNumberVerified ?? false
    newSession.hasPassword = response.user.hasPassword ?? false
    newSession.activityGrade = response.user.activityGrade ?? ""
    newSession.corporateId = mapCorporateResponseToEntity(
      input: response.user.corporateId)
    newSession.token = response.token ?? ""
    
      return newSession
    
  }
  
  static func mapLoginEntitiesToDomains(
    input entities: SessionEntity
  ) -> UserModel {
    
    return UserModel(
      token: entities.token,
      user: mapUserEntitiesToModel(input: entities))
  }
}

extension LoginMapper {
  
  static func mapUserEntitiesToModel(
    input user: SessionEntity) -> UserModelResponse {
    
    return UserModelResponse(
      id: user.id,
      activityGrade: user.activityGrade,
      activityLevel: user.activityLevel,
      bloodType: user.bloodType,
      corporateId: mapCorporateEntitiesToModel(input: user.corporateId),
      dateOfBirth: user.dateOfBirth,
      dietGoal: mapDietGoalEntitiesToModel(input: user.dietGoal),
      email: user.email,
      emailVerified: user.emailVerified,
      gender: user.gender,
      hasPassword: user.hasPassword,
      isPremium: user.isPremium,
      name: mapNameEntitiesToModel(input: user.name),
      phoneNumber: user.phoneNumber,
      phoneNumberVerified: user.phoneNumberVerified,
      s3ImagePath: user.s3ImagePath
    )
  }
  
  static func mapNameResponseToEntity(
    input name: NameResponse) -> Name {
    
    let newName = Name()
    newName.first = name.first ?? ""
    newName.last = name.last ?? ""
    
    return newName
  }
  
  static func mapDietGoalResponseToEntity(
    input dietGoal: DietGoalResponse) -> DietGoal {
    
    let newDiet = DietGoal()
    
    newDiet.id = dietGoal.id ?? ""
    newDiet.name = dietGoal.name ?? ""
    newDiet.topic = dietGoal.topic ?? ""
    newDiet.score = dietGoal.score ?? 0
    
    return newDiet
  }
  
  static func mapCorporateResponseToEntity(
    input corporate: CorporateIdResponse) -> CorporateId {
    
    let newCorporate = CorporateId()
    
    newCorporate.id = corporate.id ?? ""
    newCorporate.corporate_code = corporate.kodePerusahaan ?? ""
    newCorporate.corporate_name = corporate.namaPerusahaan ?? ""
    
    return newCorporate
  }
  
  static func mapCorporateEntitiesToModel(
    input entites: CorporateId?) -> CorporateIdResponse {
      
      return CorporateIdResponse(
        id: entites?.id,
        kodePerusahaan: entites?.corporate_code,
        namaPerusahaan: entites?.corporate_name
      )
    
  }
  
  static func mapNameEntitiesToModel(
    input entites: Name?) -> NameResponse {
    
      return NameResponse(
        first: entites?.first ?? "",
        last: entites?.last ?? ""
      )
    
  }
  
  static func mapDietGoalEntitiesToModel(
    input entites: DietGoal?) -> DietGoalResponse {

      return DietGoalResponse(
        id: entites?.id ?? "",
        name: entites?.name ?? "",
        score: entites?.score ?? 0,
        topic: entites?.topic ?? ""
      )
  }
}
