//
//  ApiManager.swift
//  ValetParking
//
//  Created by My Technology on 03/09/2018.
//  Copyright © 2018 Zafar Najmi. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiManager {
    let baseUrl = "https://hello-stream.com/projects/super-score/api/"
    static let shared = ApiManager()
    var alamoFireManager : SessionManager?
    private init()
    {
        
    }
    
    
    
    func LoginUser(email: String, password: String,fcm:String, success:  @escaping (_ user: SocialLoginMain) -> Void, failure: @escaping (_ error: NetworkError) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
        
        
        

        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 0.5
        
            let url = baseUrl + "login"
            let parameter: Parameters = [
                "email": email,
                "password": password,
                "fcm":fcm
            ]
            print(parameter)
            alamoFireManager?.request(
                url,
                method: .post,
                parameters: parameter,
                encoding: URLEncoding.httpBody)
                .responseJSON { (response) -> Void in
                    
                    
                    
                    
                    switch (response.result) {
                    case .success:
                        if let user = Mapper<SocialLoginMain>().map(JSONObject: response.result.value)
                        {
                          success(user)
                            
                        }
                        break
                        
                    case .failure(let error):
                        var networkError = NetworkError()
                        
                        if error._code == NSURLErrorTimedOut {
                            networkError.status = Constants.NetworkError.timout
                            networkError.message = Constants.NetworkError.timoutError
                            
                            failure(networkError)
                        } else {
                            networkError.status = Constants.NetworkError.generic
                            networkError.message = Constants.NetworkError.genericError
                            
                            failure(networkError)
                        }
                        
                        break
                    }
                    
//                    guard response.result.isSuccess else {
//
//                        let error = CustomError("Server Error")
//                        failure(error)
//
//
//                        return
//                    }
//
//                    if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
//
//                        failure(err)
//
//                        return
//                    }
//
//                    if let user = Mapper<SocialLoginMain>().map(JSONObject: response.result.value) {
//                        success(user)
//                        return
//                    }
                    
//                    let error = CustomError("Server Error")
//                    print("sdasdasd")
//                    failure(error)
            
        }
        
    }
    
    func SocialLogin(id:String,fullName:String,email: String, authMethod: String,accessToken:String, success:  @escaping (_ user: SocialLoginMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "social-login"
        let parameter: Parameters = [
            "id" : id,
            "fullName" : fullName,
            "email": email,
            "authMethod" : authMethod,
            "accessToken" : accessToken
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<SocialLoginMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func RegisterUser(fullName: String,email: String,password: String,passwordConfirmation: String,nic: String,phone: String, address: String,gender:String, success:  @escaping (_ user: RegisterMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "login"
        let parameter: Parameters = [
            "fullName" : fullName,
            "email": email,
            "password": password,
            "passwordConfirmation" : passwordConfirmation,
            "nic" : nic,
            "phone" : phone,
            "address" : address,
            "gender" : gender
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<RegisterMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func ResendVerification(auth:String,email: String , success:  @escaping (_ user: ResendVerificationMain ) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "auth/resend-verification-code"
        let parameter: Parameters = [
            "email": email
        ]
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody,headers: header)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<ResendVerificationMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func EmailVerfication(auth:String,email: String,verficationCode:String, success:  @escaping (_ user: ResendVerificationMain ) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "auth/email-verification"
        let parameter: Parameters = [
            "email": email,
            "verificationCode":verficationCode
        ]
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
 
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody,headers: header)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<ResendVerificationMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func ForgetPassword(email: String, success:  @escaping (_ user: ForgetPasswordMain ) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "/forgot/password"
        let parameter: Parameters = [
            "email": email
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<ForgetPasswordMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func ResetPassword(email: String,verificationCode:String,password:String,confirmPassword:String, success:  @escaping (_ user: ForgetPasswordMain ) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "/reset/password"
        let parameter: Parameters = [
            "email": email,
            "verificationCode" : verificationCode,
            "password" : password,
            "passwordConfirmation" : confirmPassword
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<ForgetPasswordMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                print("sdasdasd")
                failure(error)
        }
    }
    
    func resetPassword(oldPassword:String,newPassword:String,confirmNewPassword:String,auth:String,success:  @escaping (_ password: ResetPasswordMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let parameter: Parameters = [
            "oldPassword": oldPassword,
            "password" : newPassword,
            "passwordConfirmation" : confirmNewPassword
            
        ]
        
        let url = baseUrl + "auth/change-password"
 
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        
        
        
        manager.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let password = Mapper<ResetPasswordMain>().map(JSONObject: response.result.value) {
                    
                    success(password)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getLeagues(page:String,success:  @escaping (_ agent: GetLeaguesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "leagues?page=\(page)"
        
        
       
        
       
        
        let url = baseUrl + pageId
        
        
 
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetLeaguesMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getLeaguesSearch(page:String,search:String,lang:String,success:  @escaping (_ agent: GetLeaguesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "leagues?page=\(page)"
        let serachQuery = "&title=\(search)"
        let local = "&local=\(lang)"
        let url = baseUrl + pageId + serachQuery + local
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetLeaguesMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    
    func getTeamsSearch(id:String,page:String,search:String,lang:String,success:  @escaping (_ agent: GetTeamsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "teams?page=\(page)"
        let serachQuery = "&title=\(search)"
        let local = "&local=\(lang)"
        let leagueId = "&league=\(id)"
        
        let url = baseUrl + pageId + leagueId + serachQuery + local
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetTeamsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    
    func getLeaguesHistory(auth:String,page:String,success:  @escaping (_ agent: GetLeaguesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "auth/history/leagues?page=\(page)"
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]

        
        
        
        
        
        let url = baseUrl + pageId
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetLeaguesMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getLeagueDetail(leagueID:String,success:  @escaping (_ agent: LeagueDetailMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
       // let pageId = "leagues?page=\(page)"
        let leagueId = "league?league=\(leagueID)"
        
        
        
        
        
        let url = baseUrl + leagueId
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<LeagueDetailMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
//    func getLeaguesHistory(auth:String,page:String,success:  @escaping (_ agent: GetLeaguesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
//
//        let manager = Alamofire.SessionManager.default
//        manager.session.configuration.timeoutIntervalForRequest = 20
//
//        let pageId = "auth/history/leagues?page=\(page)"
//        let header: HTTPHeaders = [
//            "Authorization": auth
//
//        ]
//
//
//
//
//
//
//        let url = baseUrl + pageId
//
//
//
//
//
//
//        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
//            .responseJSON { (response) -> Void in
//
//
//                guard response.result.isSuccess else {
//                    let error = CustomError("Server Error")
//                    failure(error)
//                    return
//                }
//                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
//                    failure(err)
//                    return
//                }
//                if let agents = Mapper<GetLeaguesMain>().map(JSONObject: response.result.value) {
//
//                    success(agents)
//                    return
//                }
//                let error = CustomError("Server Error")
//                failure(error)
//        }
//    }
    
    
    
    func getLeaguesNews(date:String,leagueId:String,page:String,success:  @escaping (_ agent: GetLeaguesNewsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "news?page=\(page)"
        let leagueId = "&league=\(leagueId)"
        let dated = "&date=\(date)"
       // var ur = "news?page=1&league=5bb75341156438737b42a5ef"
        
        var url = ""
        
        if  date == "" {
           url = baseUrl + pageId + leagueId
        }
        else {
           url = baseUrl + pageId + leagueId + dated
        }
        
        
        
        print(url)
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetLeaguesNewsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getTeams(leagueId:String,page:String,success:  @escaping (_ agent: GetTeamsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "teams?page=\(page)"
        let leagueId = "&league=\(leagueId)"
        
        
        
        
        let url = baseUrl + pageId + leagueId
        
        
        print(url)
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetTeamsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    
    func getTeamNews(date:String,teamId:String,page:String,success:  @escaping (_ agent: GetLeaguesNewsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "news?page=\(page)"
        let leagueId = "&team=\(teamId)"
        let dated = "&date=\(date)"
        // var ur = "news?page=1&league=5bb75341156438737b42a5ef"
        
        var url = ""
        
        if  date == "" {
            url = baseUrl + pageId + leagueId
        }
        else {
            url = baseUrl + pageId + leagueId + dated
        }
        
        
        
        
       // let url = baseUrl + pageId + leagueId
        
        
        print(url)
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetLeaguesNewsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func addToFavourite(auth: String, teamId: String, success:  @escaping (_ user: FavouritesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "auth/add-favourite-team"
        let parameter: Parameters = [
            "team": teamId
            
        ]
        
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody,headers: header)
            .responseJSON { (response) -> Void in

                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }

                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }

                if let user = Mapper<FavouritesMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }

                let error = CustomError("Server Error")
                
                failure(error)
        }
    }
    
    func removeFromFavourite(auth: String, teamId: String, success:  @escaping (_ user: FavouritesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "auth/remove-favourite-team"
        let parameter: Parameters = [
            "team": teamId
            
        ]
        
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody,headers: header)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<FavouritesMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                
                failure(error)
        }
    }
    
    func getPlayers(teamid:String,page:String,success:  @escaping (_ agent: GetPlayersMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "players?page=\(page)"
        let teamId = "&team=\(teamid)"
        // var ur = "news?page=1&league=5bb75341156438737b42a5ef"
       // "teams?page=1&league=5bb75341156438737b42a5ef"
        //players?page=1&team=5bbb2e0ac276340146c99b11
        
        
        let url = baseUrl + pageId + teamId
        
        
        print(url)
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetPlayersMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func playerMatchHistory(playerid:String,page:String,success:  @escaping (_ agent: PlayerMatchHistoryMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let pageId = "player/matches?page=\(page)"
        let playerId = "&player=\(playerid)"
        // var ur = "news?page=1&league=5bb75341156438737b42a5ef"
        // "teams?page=1&league=5bb75341156438737b42a5ef"
        //players?page=1&team=5bbb2e0ac276340146c99b11
        
        //player/matches?page=1&player=5bbb3545c276340146c99b1b
        let url = baseUrl + pageId + playerId
        
        
        print(url)
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<PlayerMatchHistoryMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func viewFavourite(auth:String,success:  @escaping (_ agent: GetTeamsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
      
        let url = baseUrl + "auth/view-favourite-teams"
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetTeamsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getWinner(league:String,status:String,success:  @escaping (_ agent: GetWinnerMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        
        
        //winners?league=5bb76ef2e4eb5f78af053ec0&status=week
        
        
        let leagueId = "winners?league=\(league)"
        let Status = "&status=\(status)"
        
        let url = baseUrl + leagueId + Status
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GetWinnerMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func subscribedLeague(auth: String, leagueId: String,paymentId:String, success:  @escaping (_ user: SubscribedLeagueMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "auth/league/payment"
        let parameter: Parameters = [
            "league": leagueId,
            "paymentId": paymentId
            
        ]
        
        
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody,headers: header)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<SubscribedLeagueMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                
                failure(error)
        }
    }
    
    func contactUs(name: String, email: String,subject:String,message:String, success:  @escaping (_ user: ForgetPasswordMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        let url = baseUrl + "contact-us"
        let parameter: Parameters = [
            "name": name,
            "email": email,
            "subject": subject,
            "message": message
            
        ]
        
        
        
        print(parameter)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.httpBody)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                
                if let user = Mapper<ForgetPasswordMain>().map(JSONObject: response.result.value) {
                    success(user)
                    return
                }
                
                let error = CustomError("Server Error")
                
                failure(error)
        }
    }
    
    func getSetting(success:  @escaping (_ agent: SettingMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        
        
        //winners?league=5bb76ef2e4eb5f78af053ec0&status=week
        
        
        
        
        let url = baseUrl + "settings"
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<SettingMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getLeaguesHistoryRounds(auth:String,page:String,league:String,success:  @escaping (_ agent: HistoryLeagueRoundsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
       // auth/history/leagues/rounds?page=1&league=5bb75291156438737b42a5ed
        let pageId = "auth/history/leagues/rounds?page=\(page)"
        let leagueId = "&league=\(league)"
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        let url = baseUrl + pageId + leagueId
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<HistoryLeagueRoundsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getLeaguesHistoryRoundsMatches(auth:String,page:String,league:String,round:String,status:String,success:  @escaping (_ agent: HistoryLeagueRoundDetailMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        // auth/history/leagues/rounds?page=1&league=5bb75291156438737b42a5ed
        //auth/history/leagues/rounds/matches?page=1&league=5bb75291156438737b42a5ed&round=5bbc84185519d647d4b50827&status=won
        
        
        let pageId = "auth/history/leagues/rounds/matches?page=\(page)"
        let leagueId = "&league=\(league)"
        let roundId = "&round=\(round)"
        let Status = "&status=\(status)"
        
        print(leagueId)
        print(roundId)
        print(status)
        let header: HTTPHeaders = [
            "Authorization": auth
            
        ]
        let url = baseUrl + pageId + leagueId + roundId + Status
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<HistoryLeagueRoundDetailMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    
    func getrounds(date:String,league:String,success:  @escaping (_ agent: RoundsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        let leagueId = "rounds?league=\(league)"
        let dated = "&date=\(date)"
        let url = baseUrl + leagueId + dated
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<RoundsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getMatches(date:String,page:String,league:String,round:String,success:  @escaping (_ agent: MatchesMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        // auth/history/leagues/rounds?page=1&league=5bb75291156438737b42a5ed
        //auth/history/leagues/rounds/matches?page=1&league=5bb75291156438737b42a5ed&round=5bbc84185519d647d4b50827&status=won
        
        //matches?page=1&league=5bb75341156438737b42a5ef&round=5bbdd635163f087f0d550f55
        
        let pageId = "matches?page=\(page)"
        let leagueId = "&league=\(league)"
        let roundId = "&round=\(round)"
        let dated = "&date=\(date)"
        
        
        
        
        let url = baseUrl + pageId + leagueId + roundId + dated
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<MatchesMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func getGuessRounds(auth:String,leagueId:String,success:  @escaping (_ agent:GuessRoundsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let league = "auth/guess/rounds/list?league=\(leagueId)"
        //let pageId = "auth/history/leagues?page=\(page)"
        let header: HTTPHeaders = [
            "Authorization": auth
        ]
        let url = baseUrl + league
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GuessRoundsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    func predictGuessRounds(auth:String,leagueId:String,success:  @escaping (_ agent:GuessRoundsMain) -> Void, failure: @escaping (_ error: CustomError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        let league = "auth/guess/rounds/list?league=\(leagueId)"
        //let pageId = "auth/history/leagues?page=\(page)"
        let header: HTTPHeaders = [
            "Authorization": auth
        ]
        let url = baseUrl + league
        
        
        
        
        
        
        manager.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
            .responseJSON { (response) -> Void in
                
                
                guard response.result.isSuccess else {
                    let error = CustomError("Server Error")
                    failure(error)
                    return
                }
                if let err = Mapper<CustomError>().map(JSONObject: response.result.value) {
                    failure(err)
                    return
                }
                if let agents = Mapper<GuessRoundsMain>().map(JSONObject: response.result.value) {
                    
                    success(agents)
                    return
                }
                let error = CustomError("Server Error")
                failure(error)
        }
    }
    
    
}


    
    

