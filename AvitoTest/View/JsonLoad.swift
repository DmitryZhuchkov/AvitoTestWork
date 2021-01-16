//
//  JsonLoad.swift
//  AvitoTestWork
//
//  Created by Дмитрий Жучков on 13.01.2021.
//

import Foundation
public class JsonLoad {
    @Published var resultData: Welcome?
    init() {
        getData()
    }
    func getData() {
        if let fileLocation = Bundle.main.url(forResource: "result", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(Welcome.self, from: data)
                self.resultData = dataFromJson
            } catch {
                print(error)
                return
            }
            
        }
    }
}
