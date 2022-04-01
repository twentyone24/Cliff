//
//  CollectionUtils.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

extension Sequence where Element: Hashable {
    /// Filters only distinct elements.
    var distinct: [Element] {
        var found = Set<Element>()
        var xs = [Element]()
        for x in self {
            let (inserted, _) = found.insert(x)
            if inserted {
                xs.append(x)
            }
        }
        return xs
    }
}

extension Collection {
    var nilIfEmpty: Self? {
        isEmpty ? nil : self
    }
}
