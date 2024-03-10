//
//  ProfileView.swift
//  Motiv
//
//  Created by 김응철 on 3/10/24.
//

import SwiftUI

struct ProfileView: View {
  
  enum ListItem {
    case likes
    case appearance
    case font
    case widget
    case languange
    case version
    case contact
    case openSource
    case review
  
    var title: String {
      switch self {
      case .likes: "좋아하는 명언"
        
      case .appearance: "화면 스타일"
      case .font: "폰트"
      case .languange: "언어"
      case .widget: "위젯"
        
      case .openSource: "오픈소스 라이브러리"
      case .review: "앱 평가"
      case .contact: "문의하기"
      case .version: "버전"
      }
    }
    
    var image: Image {
      switch self {
      case .likes:
        Image.heart_fill

      case .appearance:
        Image.moon_fill
      case .font:
        Image.abc
      case .languange:
        Image.globe
      case .widget:
        Image.square_dashed_inset_filled
        
      case .contact:
        Image.envelope_fill
      case .openSource:
        Image.contextualmenu_and_cursorarrow
      case .version:
        Image.checkmark_seal_fill
      case .review:
        Image.star_leadinghalf_filled
      }
    }
  }
  
  struct SectionItem: Identifiable {
    let id = UUID()
    let title: String
    let items: [ListItem]
  }
  
  private let sectionItems: [SectionItem] = [
    SectionItem(
      title: "계정",
      items: [.likes]
    ),
    SectionItem(
      title: "스타일",
      items: [.appearance, .font, .widget, .languange]
    ),
    SectionItem(
      title: "서비스",
      items: [.contact, .review]
    ),
    SectionItem(
      title: "앱",
      items: [.version, .openSource]
    )
  ]
  
  @Environment(\.colorScheme) private var colorScheme
  
  var body: some View {
    List {
      ForEach(sectionItems) { sectionItem in
        Section {
          ForEach(sectionItem.items, id: \.self) { item in
            settingListView(item)
              .listRowSeparator(.hidden)
          }
        } header: {
          Text(sectionItem.title)
        }
      }
    }
    .listStyle(.plain)
  }
  
  @ViewBuilder
  func settingListView(_ listItem: ListItem) -> some View {
    HStack(spacing: Metrics.hStackSpacing) {
      ZStack {
        RoundedRectangle(cornerRadius: Metrics.imageBackgroundCornerRadius)
          .fill(.motiv)
          .frame(width: Metrics.imageSize, height: Metrics.imageSize)
          .overlay(
            listItem.image
              .resizable()
              .scaledToFit()
              .symbolRenderingMode(.monochrome)
              .foregroundStyle(colorScheme == .dark ? .black : .white)
              .padding(Metrics.imagePadding)
              .frame(width: Metrics.imageSize, height: Metrics.imageSize)
          )
      }
      Text(listItem.title)
        .font(.subheadline)
        .fontWeight(.medium)
    }
  }
}

private extension ProfileView {
  enum Metrics {
    static let hStackSpacing = 12.0
    static let imageSize = 24.0
    static let imageBackgroundCornerRadius = 4.0
    static let imagePadding = 4.0
  }
}

#Preview {
  ProfileView()
}
