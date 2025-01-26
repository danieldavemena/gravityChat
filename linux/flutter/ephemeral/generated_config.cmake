# Generated code do not commit.
file(TO_CMAKE_PATH "/workspaces/codespaces-blank/flutter" FLUTTER_ROOT)
file(TO_CMAKE_PATH "/workspaces/codespaces-blank/flutterplayground" PROJECT_DIR)

set(FLUTTER_VERSION "1.0.0+1" PARENT_SCOPE)
set(FLUTTER_VERSION_MAJOR 1 PARENT_SCOPE)
set(FLUTTER_VERSION_MINOR 0 PARENT_SCOPE)
set(FLUTTER_VERSION_PATCH 0 PARENT_SCOPE)
set(FLUTTER_VERSION_BUILD 1 PARENT_SCOPE)

# Environment variables to pass to tool_backend.sh
list(APPEND FLUTTER_TOOL_ENVIRONMENT
  "FLUTTER_ROOT=/workspaces/codespaces-blank/flutter"
  "PROJECT_DIR=/workspaces/codespaces-blank/flutterplayground"
  "DART_OBFUSCATION=false"
  "TRACK_WIDGET_CREATION=true"
  "TREE_SHAKE_ICONS=false"
  "PACKAGE_CONFIG=/workspaces/codespaces-blank/flutterplayground/.dart_tool/package_config.json"
  "FLUTTER_TARGET=/workspaces/codespaces-blank/flutterplayground/lib/main.dart"
)
