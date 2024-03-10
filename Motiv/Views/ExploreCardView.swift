//
//  MotivListCardView.swift
//  Motiv
//
//  Created by 김응철 on 2/27/24.
//

import SwiftUI

struct ExploreCardView: View {
  
  var body: some View {
    ZStack(alignment: .center) {
      VStack(spacing: Metrics.spacing) {
        Image.quote_opening
        Text("능수능란하고 용감한 자들은 군지휘관으로 길렀다. 민첩하고 유연한 자들은 말을 다루도록 했다. 능숙하지 않은 자들은 작은 채찍을 주어 양치기가 되게 하였다.")
          .multilineTextAlignment(.center)
          .font(.title2)
          .lineSpacing(Metrics.lineSpacing)
          .fontWeight(.light)
        Text("김응철")
          .font(.subheadline)
          .fontWeight(.ultraLight)
      }
      HStack(spacing: Metrics.iconSpacing) {
        Group {
          Button {} label: {
            Image.heart
              .resizable()
          }
          Button {} label: {
            Image.square_and_arrow_up
              .resizable()
          }
        }
        .scaledToFit()
        .frame(width: Metrics.iconSize, height: Metrics.iconSize)
      }
      .frame(maxHeight: .infinity, alignment: .bottom)
      .padding(.bottom, Metrics.iconBottomPadding)
    }
    .foregroundStyle(.motiv)
    .padding(.horizontal, Metrics.horizontalPadding)
  }
}

private extension ExploreCardView {
  enum Metrics {
    static let horizontalPadding = 24.0
    static let spacing = 16.0
    static let lineSpacing = 6.0
    static let cornerRadius = 8.0
    static let shadowRadius = 0.5
    
    static let iconSpacing = 32.0
    static let iconSize = 24.0
    static let iconBottomPadding = 80.0
  }
}

#Preview {
  ExploreCardView()
}
