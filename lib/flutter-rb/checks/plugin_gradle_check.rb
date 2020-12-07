require_relative './check'
require_relative '../report/check_report'

module FlutterRb
  # Check Flutter plugin's version in build.gradle file
  class PluginGradleVersionCheck < Check
    def name
      'PluginGradleVersionCheck'
    end

    def summary
      'Validate Flutter plugin\s version in build.gradle file'
    end

    def check(project)
      version_in_pubspec = project.pubspec.pubspec_info.version
      version_in_gradle = project.android_folder.gradle.version
      CheckReport.new(
        name,
        version_in_pubspec == version_in_gradle ? CheckReportStatus::NORMAL : CheckReportStatus::WARNING,
        description
      )
    end
  end
end
