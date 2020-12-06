require_relative 'check'
require_relative '../report/check_report'

module FlutterRb
  # Base class for all info parameters in Flutter plugin's pubspec.yaml file
  class PluginPubspecCheck < Check
    def name
      "PluginPubspec#{pubspec_parameter.capitalize}Check"
    end

    def pubspec_parameter
      UNIMPLEMENTATION_ERROR
    end

    def summary
      "Validate Flutter plugin's #{pubspec_parameter} in pubspec.yaml"
    end
  end

  # Check Flutter plugin's name
  class PluginPubspecNameCheck < PluginPubspecCheck
    def pubspec_parameter
      'name'
    end

    def check(project)
      pubspec = project.pubspec
      CheckReport.new(
        name,
        pubspec.pubspec_info.name.nil? ? CheckReportStatus::ERROR : CheckReportStatus::NORMAL,
        description
      )
    end
  end

  # Check Flutter plugin's description
  class PluginPubspecDescriptionCheck < PluginPubspecCheck
    def pubspec_parameter
      'description'
    end

    def check(project)
      pubspec = project.pubspec
      CheckReport.new(
        name,
        pubspec.pubspec_info.description.nil? ? CheckReportStatus::WARNING : CheckReportStatus::NORMAL,
        description
      )
    end
  end

  # Check Flutter plugin's version
  class PluginPubspecVersionCheck < PluginPubspecCheck
    def pubspec_parameter
      'version'
    end

    def check(project)
      pubspec = project.pubspec
      CheckReport.new(
        name,
        pubspec.pubspec_info.version.nil? ? CheckReportStatus::ERROR : CheckReportStatus::NORMAL,
        description
      )
    end
  end

  # Check Flutter plugin's author
  class PluginPubspecAuthorCheck < PluginPubspecCheck
    def pubspec_parameter
      'author'
    end

    def check(project)
      pubspec = project.pubspec
      CheckReport.new(
        name,
        pubspec.pubspec_info.author.nil? ? CheckReportStatus::WARNING : CheckReportStatus::NORMAL,
        description
      )
    end
  end

  # Check Flutter plugin's homepage
  class PluginPubspecHomepageCheck < PluginPubspecCheck
    def pubspec_parameter
      'homepage'
    end

    def check(project)
      pubspec = project.pubspec
      CheckReport.new(
        name,
        pubspec.pubspec_info.homepage.nil? ? CheckReportStatus::ERROR : CheckReportStatus::NORMAL,
        description
      )
    end
  end

  # Check Flutter plugin's Effective Dart depencency
  class PluginPubspecEffectiveDartCheck < Check
    def name
      'PluginPubspecEffectiveDartCheck'
    end

    def summary
      'Validate Flutter plugin\'s Effective Dart rules implementation in pubspec.yaml'
    end

    def check(project)
      effective_dart = project.pubspec.dev_dependencies&.detect do |dev_dependency|
        dev_dependency.name == 'effective_dart'
      end
      CheckReport.new(
        name,
        effective_dart.nil? ? CheckReportStatus::ERROR : CheckReportStatus::NORMAL,
        description
      )
    end
  end
end
