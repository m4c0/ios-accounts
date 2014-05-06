Pod::Spec.new do |s|
  s.name             = "SimplifiedACAccounts"
  s.version          = "0.1.0"
  s.summary          = "Simplifies the usage of ACAccounts by treating the most common scenarios and errors."
  s.description      = <<-DESC
                       An optional longer description of SimplifiedACAccounts

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/m4c0/ios-accounts"
  s.license          = 'LGPLv3'
  s.author           = { "Eduardo Costa" => "iosaccounts@tpk.com.br" }
  s.source           = { :git => "https://github.com/m4c0/ios-accounts.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/ios'
  s.resources = 'Assets/*.png'
end
