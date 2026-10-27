Pod::Spec.new do |s|
  s.name             = 'APIVerveBirthChart'
  s.version          = '1.2.3'
  s.summary          = 'Birth Chart calculates a tropical natal chart from a birth date, time and location.'
  s.description      = <<-'DESC'
Birth Chart calculates a tropical natal chart from a birth date, time and location. It returns the sun, moon and rising signs, the ascendant and midheaven, and each planet's sign, degree and retrograde flag. Paid plans add the 12 house cusps, each planet's house, the major aspects and the element and modality balance.

This iOS/macOS SDK provides a convenient way to access the Birth Chart from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/birthchart?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/birthchart-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveBirthChart/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
