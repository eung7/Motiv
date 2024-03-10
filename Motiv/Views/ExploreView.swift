//
//  MotivListView.swift
//  Motiv
//
//  Created by 김응철 on 2/27/24.
//

import SwiftUI

struct ExploreView: View {
  @State private var isPresentedSheet = false
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical) {
        LazyVStack(spacing: 0) {
          ForEach(Range(1...10)) { _ in
            ExploreCardView()
              .frame(maxWidth: .infinity)
              .containerRelativeFrame(.vertical)
          }
        }
        .scrollTargetLayout()
      }
      .ignoresSafeArea(.container, edges: .all)
      .scrollTargetBehavior(.paging)
      .scrollIndicators(.hidden)
      .overlay(alignment: .top) {
        Group {
          Button {
            isPresentedSheet.toggle()
          } label: {
            Image.line_3_horizontal_decrease
              .resizable()
              .scaledToFit()
              .frame(width: Metrics.iconSize)
              .foregroundStyle(.motiv)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          Text(QuoteTag.all.tagString)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.motiv)
          NavigationLink {
            ProfileView()
          } label: {
            Image.gear
              .resizable()
              .scaledToFit()
              .frame(width: Metrics.iconSize)
              .foregroundStyle(.motiv)
          }
          .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(Metrics.iconPadding)
        .padding(.top, -8.0)
      }
      .onTapGesture(count: 2) {
        // TODO: 두번 탭 했을 때 좋아요 버튼 누르는 로직
      }
      .sheet(isPresented: $isPresentedSheet) {
        MotivTagsView()
          .presentationDetents([.height(Metrics.sheetHeight)])
          .presentationCornerRadius(Metrics.sheetCornerRadius)
          .presentationDragIndicator(.visible)
      }
    }
  }
}

#Preview {
  ExploreView()
}

// MARK: - Metrics

private extension ExploreView {
  enum Metrics {
    static let iconPadding = 24.0
    static let iconSize = 24.0
    
    static let sheetHeight = 500.0
    static let sheetCornerRadius = 20.0
  }
}
