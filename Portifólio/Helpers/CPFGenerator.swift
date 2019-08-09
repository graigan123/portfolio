//
//  CPFGenerator.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class CPF {
    class func generateCPF() -> String {
        var cpf = [0,0,0,0,0,0,0,0,0,0,0]
        var temp1 = 0,temp2 = 0

        for index in 0...8 {
            cpf[index] = (Int)(arc4random_uniform(9))
            temp1 += cpf[index] * (10 - index)
            temp2 += cpf[index] * (11 - index)
        }

        temp1 %= 11
        cpf[9] = temp1 < 2 ? 0 : 11 - temp1

        temp2 += cpf[9] * 2
        temp2 %= 11
        cpf[10] = temp2 < 2 ? 0 : 11 - temp2

        return "\(cpf[0])\(cpf[1])\(cpf[2]).\(cpf[3])\(cpf[4])\(cpf[5]).\(cpf[6])\(cpf[7])\(cpf[8])-\(cpf[9])\(cpf[10])"
    }
}
