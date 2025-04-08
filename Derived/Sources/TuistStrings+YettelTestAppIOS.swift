// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum YettelTestAppIOSStrings: Sendable {
  /// HUF
  public static let currency = YettelTestAppIOSStrings.tr("Localizable", "currency")
  /// National vignettes
  public static let highwayVignettesNationalVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__national_vignettes_title")
  /// Pay
  public static let highwayVignettesPayButtonTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__pay_button_title")
  /// E-vignette
  public static let highwayVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__title")
  /// Yearly counties vignettes
  public static let highwayVignettesYearlyVignettesTitle = YettelTestAppIOSStrings.tr("Localizable", "highway_vignettes__yearly_vignettes_title")
  /// daily (1 day)
  public static let vignetteTypeDayTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_day_title")
  /// monthly
  public static let vignetteTypeMonthTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_month_title")
  /// weekly (10 days)
  public static let vignetteTypeWeekTitle = YettelTestAppIOSStrings.tr("Localizable", "vignette_type_week_title")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension YettelTestAppIOSStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all
