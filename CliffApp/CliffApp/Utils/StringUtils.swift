//
//  StringUtils.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

extension String {
    func pluralized(with n: Int) -> String {
        n == 1 ? self : "\(self)s"
    }
}
