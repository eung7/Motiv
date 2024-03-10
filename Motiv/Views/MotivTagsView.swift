//
//  MotivTagsView.swift
//  Motiv
//
//  Created by 김응철 on 3/10/24.
//

import SwiftUI

private struct TagLayout: Layout {
  var alignment: Alignment = .leading
  var spacing: CGFloat = 10
  
  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {
    let maxWidth = proposal.width ?? 0
    var height: CGFloat = 0
    let rows = getRows(maxWidth, proposal, subviews)
    
    for (index, row) in rows.enumerated() {
      if index == (rows.count - 1) {
        height += row.maxHeight(proposal)
      } else {
        height += row.maxHeight(proposal) + spacing
      }
    }
    return .init(width: maxWidth, height: height)
  }
  
  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {
    var origin = bounds.origin
    let maxWidth = bounds.width
    let rows = getRows(maxWidth, proposal, subviews)
    
    for row in rows {
      origin.x = 0
      
      for view in row {
        let viewSize = view.sizeThatFits(proposal)
        view.place(at: origin, proposal: proposal)
        origin.x += (viewSize.width + spacing)
      }
      
      origin.y += (row.maxHeight(proposal) + spacing)
    }
  }
  
  func getRows(
    _ maxWidth: CGFloat,
    _ proposal: ProposedViewSize,
    _ subviews: Subviews
  ) -> [[LayoutSubviews.Element]] {
    var row = [LayoutSubviews.Element]()
    var rows = [[LayoutSubviews.Element]]()
    var origin = CGRect.zero.origin
    
    for view in subviews {
      let viewSize = view.sizeThatFits(proposal)
      
      if (origin.x + viewSize.width + spacing) > maxWidth {
        rows.append(row)
        row.removeAll()
        origin.x = 0
        row.append(view)
        origin.x += (viewSize.width + spacing)
      } else {
        row.append(view)
        origin.x += (viewSize.width + spacing)
      }
    }
    
    if !row.isEmpty {
      rows.append(row)
      row.removeAll()
    }
    return rows
  }
}

extension [LayoutSubviews.Element] {
  func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
    return self.compactMap { view in
      return view.sizeThatFits(proposal).height
    }.max() ?? 0
  }
}

private struct TagSectionItem: Identifiable {
  let id = UUID()
  let title: String
  let tags: [QuoteTag]
}

struct MotivTagsView: View {
  @Environment(\.colorScheme) private var colorScheme: ColorScheme
  @Environment(\.dismiss) private var dismiss
  
  private let sectionItem: [TagSectionItem] = [
    TagSectionItem(title: "전체 보기", tags: [.all]),
    TagSectionItem(
      title: "인생과 감정",
      tags: [.love, .life, .happiness, .hope, .dream, .confidence, .consolation]
    ),
    TagSectionItem(
      title: "자기계발과 성공",
      tags: [.study, .success, .confidence, .courage, .challange, .work]
    ),
    TagSectionItem(
      title: "관계와 소통",
      tags: [.friend, .family]
    ),
    TagSectionItem(
      title: "재정과 경제",
      tags: [.money, .invest]
    ),
    TagSectionItem(
      title: "정신과 신념",
      tags: [.religion]
    )
  ]
  
  var body: some View {
    ScrollView(.vertical) {
      TagLayout(alignment: .leading, spacing: Metrics.layoutSpacing) {
        ForEach(sectionItem) { sectionItem in
          Section {
            ForEach(sectionItem.tags, id: \.self) { tag in
              tagButton(tag)
            }
          } header: {
            Text(sectionItem.title)
              .fontWeight(.semibold)
              .font(.title3)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.top, Metrics.headerTopPadding)
            Divider()
          }
        }
      }
    }
    .padding(Metrics.scrollViewPadding)
    .scrollIndicators(.hidden)
  }
  
  @ViewBuilder
  func tagButton(_ quoteTag: QuoteTag) -> some View {
    Button {
      dismiss.callAsFunction()
    } label: {
      Text(quoteTag.tagString)
        .font(.caption)
        .fontWeight(.semibold)
        .foregroundStyle(colorScheme == .dark ? .black : .white)
        .padding(Metrics.tagButtonPadding)
        .background(
          RoundedRectangle(cornerRadius: Metrics.cornerRadius)
            .fill(.motiv)
        )
    }
  }
}

private extension MotivTagsView {
  enum Metrics {
    static let layoutSpacing = 8.0
    static let tagButtonPadding = 10.0
    static let scrollViewPadding = 24.0
    static let headerTopPadding = 24.0
    static let cornerRadius = 12.0
  }
}

#Preview {
  MotivTagsView()
}

