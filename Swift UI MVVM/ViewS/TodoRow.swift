//
//  TodoRow.swift
//  Swift UI MVVM
//
//  Created by Shourob Datta (Wipro Macbook) on 13/8/20.
//  Copyright © 2020 Shourob. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        Text(todo.title)
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo(title: "Buy groceries"))
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
