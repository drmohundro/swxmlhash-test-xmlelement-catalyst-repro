//
//  ContentView.swift
//  swxmlhash-test
//
//  Created by David Mohundro on 3/12/22.
//

import SwiftUI
import SWXMLHash

let xmlContent = """
<root>
<catalog>
<book id=\"bk101\">
  <author>Gambardella, Matthew</author>
  <title>XML Developer's Guide</title>
  <genre>Computer</genre><price>44.95</price>
  <publish_date>2000-10-01</publish_date>
</book>
<book id=\"bk102\">
  <author>Ralls, Kim</author>
  <title>Midnight Rain</title>
  <genre>Fantasy</genre>
  <price>5.95</price>
  <publish_date>2000-12-16</publish_date>
</book>
<book id=\"bk103\">
  <author>Corets, Eva</author>
  <title>Maeve Ascendant</title>
  <genre>Fantasy</genre>
  <price>5.95</price>
  <publish_date>2000-11-17</publish_date>
</book>
</catalog>
</root>
"""

struct ContentView: View {
    let firstAuthor: String
    
    init() {
        let xml = XMLHash.parse(xmlContent)
        let element: SWXMLHash.XMLElement? = xml["root"]["catalog"]["book"][0]["author"].element
        
        firstAuthor =  element!.text
    }
    
    var body: some View {
        Text("Hello \(firstAuthor)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
