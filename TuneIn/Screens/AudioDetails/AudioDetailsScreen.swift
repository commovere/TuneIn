//
//  AudioDetailsScreen.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 24.12.2022.
//

import SwiftUI

struct AudioDetailsScreen: View {
    let data: AudioElementModel
    
    init(_ data: AudioElementModel){
        self.data = data
    }
    var body: some View {
        VStack {
            if let imageUrl = data.image {
                AsyncImage(url: .init(string: imageUrl), content: { image in
                        image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 300)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).cornerRadius(8)
            }
            Text(data.text).font(.title3)
            if let subtext = data.subtext {
                Text(subtext).font(.caption)
            }
            HStack{
                Text("bitrate:").bold()
                Spacer()
                Text("\(data.bitrate ?? "N/A")")
            }
            .padding(.top)
            HStack {
                Text("formats:").bold()
                Spacer()
                Text("\(data.formats ?? "N/A")")
            }
            Spacer()
        }
        .padding(.horizontal)
        .onAppear{
            AudioPlayer.shared.play(data.url)
        }
        .onDisappear{
            AudioPlayer.shared.pauseOrResume()
        }
    }
}

struct AudioDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AudioDetailsScreen(.init(
            text: "Some big and long title",
            url: "http://opml.radiotime.com/Tune.ashx?id=s218302",
            image: "http://cdn-radiotime-logos.tunein.com/s218302q.png",
            subtext: "some subtitle",
            bitrate: "10",
            formats: "mp3")
        )
    }
}
