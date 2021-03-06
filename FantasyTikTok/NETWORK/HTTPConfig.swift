//
//  ApiCenter.swift
//  Cashmix
//
//  Created by 赵翔宇 on 2021/12/18.
//

import FantasyUI



struct ProjectConfig {
    static let env: Environment = .test
    
    enum Environment {
    case test, prod
    }
    
    static var scheme: String { "https" }
    
    static var host: String {
        switch env {
        case .test: return "open.douyin.com" //
        case .prod: return "" //
        }
    }
    
    static var port: Int? {
        return nil
    }
    
   
    
    static var firstPath: String? {
        switch env {
        case .test: return ""
        case .prod: return ""
        }
    }
}


protocol ApiType: CustomTargetType {
    
}

extension ApiType {
    
    var scheme: String { ProjectConfig.scheme }
    var host: String { ProjectConfig.host }
    var port: Int? { ProjectConfig.port }
    var firstPath: String? { ProjectConfig.firstPath }
    

  

}

