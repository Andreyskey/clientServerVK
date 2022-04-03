//
//  APIService.swift
//  clientServerVK
//
//  Created by Андрей Волков on 03.04.2022.
//

import UIKit
import Alamofire

class APIService {
    
    private let baseUrl = "https://api.vk.com"
    
    private let token = Session.shared.token
    private let userId = Session.shared.userID
    
    func getFriends() {
        let path = "/method/friends.get"
        let params: Parameters = [
            "access_token": token,
            "user_id": userId,
            "order": "random",
            "v": "5.131"
        ]
        print("Получение друзей пользователя")
        requestAF(url: baseUrl+path, method: .get, params: params)
    }
    
    func getPhotos() {
        let path = "/method/photos.getAll"
        let params: Parameters = [
            "access_token": token,
            "owner_id": userId,
            "v": "5.131",
            "no_service_albums": "1",
            "count": "25",
            "extended": "0"
        ]
        print("Получение фото пользователя")
        requestAF(url: baseUrl+path, method: .get, params: params)
    }
    
    func getGroup() {
        let path = "/method/groups.get"
        let params: Parameters = [
            "access_token": token,
            "user_id": userId,
            "v": "5.131",
            "extended": "1"
            ]
        print("Получение групп пользователя")
        requestAF(url: baseUrl+path, method: .get, params: params)
    }
    
    func getSearchGroup() {
        let textSearch = "Мос" // Импровизированный поиск
        
        let path = "/method/groups.search"
        let params: Parameters = [
            "access_token": token,
            "user_id": userId,
            "v": "5.131",
            "q": textSearch
            ]
        print("Получение групп по поиску")
        requestAF(url: baseUrl+path, method: .get, params: params)
    }
    
//MARK: - Функция для запроса
    
    private func requestAF(url: String, method: HTTPMethod, params: Parameters) {
        AF.request(url, method: method, parameters: params).responseData { response in
            guard let data = response.data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            else { return }
            print(json)
        }
    }
}
