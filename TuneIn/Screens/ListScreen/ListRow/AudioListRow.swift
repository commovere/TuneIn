//
//  AudioListRow.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import SwiftUI

struct AudioListRow: View {
    var data: AudioElementModel
    
    init(_ data: AudioElementModel){
        self.data = data
    }

    var body: some View {
        HStack {
            if let imageUrl = data.image {
                AsyncImage(url: .init(string: imageUrl), content: { image in
                        image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(data.text).font(.title3)
                    .lineLimit(1)
                if let subtext = data.subtext {
                    Text(subtext).font(.caption)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct AudioListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AudioListRow(.init(
                text: "Some big and long title",
                url: "http://opml.radiotime.com/Tune.ashx?id=s218302",
                image: "http://cdn-radiotime-logos.tunein.com/s218302q.png",
                subtext: "some subtitle",
                bitrate: "10",
                formats: "mp3")
            )
            AudioListRow(.init(
                text: "Some big and long title",
                url: "http://opml.radiotime.com/Tune.ashx?id=s218302",
                image: "http://cdn-radiotime-logos.tunein.com/s218302q.png",
                subtext: "some subtitle",
                bitrate: "10",
                formats: "mp3")
            )
        }
    }
}
