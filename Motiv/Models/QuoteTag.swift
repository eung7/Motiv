//
//  QuoteTags.swift
//  Motiv
//
//  Created by 김응철 on 3/10/24.
//

import Foundation

enum QuoteTag: String, CaseIterable {
  /// 전체보기
  case all
  /// 사랑
  case love
  /// 인생
  case life
  /// 공부
  case study
  /// 성공
  case success
  /// 친구
  case friend
  /// 가족
  case family
  /// 자신감
  case confidence
  /// 용기
  case courage
  /// 희망
  case hope
  /// 꿈
  case dream
  /// 위로
  case consolation
  /// 도전정신
  case challange
  /// 행복
  case happiness
  /// 일
  case work
  /// 돈
  case money
  /// 투자
  case invest
  /// 종교
  case religion
  
  var tagString: String {
    switch self {
    case .all: "🌱 전체 보기"
    case .love: "❤️ 사랑"
    case .life: "🕰️ 인생"
    case .study: "📚 공부"
    case .success: "🏆 성공"
    case .friend: "👥 인간관계"
    case .family: "👨‍👩‍👧‍👧 가족"
    case .confidence: "😎 자신감"
    case .courage: "🏄🏼‍♂️ 용기"
    case .hope: "☀️ 희망"
    case .dream: "🌙 꿈"
    case .consolation: "🤧 위로"
    case .challange: "🚵 도전정신"
    case .happiness: "☺️ 행복"
    case .work: "💼 일"
    case .money: "💵 돈"
    case .invest: "📈 투자"
    case .religion: "🙏 종교"
    }
  }
}
