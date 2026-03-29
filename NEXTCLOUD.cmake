# SPDX-FileCopyrightText: 2017 Nextcloud GmbH and Nextcloud contributors
# SPDX-FileCopyrightText: 2012 ownCloud GmbH
# SPDX-License-Identifier: GPL-2.0-or-later

if(NEXTCLOUD_DEV)
    set( APPLICATION_NAME       "LRACloudDev" )
    set( APPLICATION_SHORTNAME  "LRACloudDev" )
    set( APPLICATION_EXECUTABLE "lraclouddev" )
    set( APPLICATION_ICON_NAME  "LRACloud" )
else()
    set( APPLICATION_NAME       "LRA Cloud" )
    set( APPLICATION_SHORTNAME  "LRACloud" )
    set( APPLICATION_EXECUTABLE "lracloud" )
    set( APPLICATION_ICON_NAME  "${APPLICATION_SHORTNAME}" )
endif()

set( APPLICATION_CONFIG_NAME "${APPLICATION_EXECUTABLE}" )
set( APPLICATION_DOMAIN     "lrasolucoes.com.br" )
set( APPLICATION_VENDOR     "LRA Solucoes" )
set( APPLICATION_UPDATE_URL "" CACHE STRING "URL for updater" )
set( APPLICATION_HELP_URL   "" CACHE STRING "URL for the help menu" )

if(APPLE AND APPLICATION_NAME STREQUAL "LRA Cloud" AND EXISTS "${CMAKE_SOURCE_DIR}/theme/colored/LRACloud-macOS-icon.svg")
    set( APPLICATION_ICON_NAME "LRACloud-macOS" )
    message("Using macOS-specific application icon: ${APPLICATION_ICON_NAME}")
endif()

set( APPLICATION_ICON_SET   "SVG" )
set( APPLICATION_SERVER_URL "https://cloud.lrasolucoes.com.br" CACHE STRING "URL for the server to use. If entered, the UI field will be pre-filled with it" )
set( APPLICATION_SERVER_URL_ENFORCE ON )
set( APPLICATION_REV_DOMAIN "com.lrasolucoes.desktopclient" )
set( DEVELOPMENT_TEAM "NKUJUXUJ3B" CACHE STRING "Apple Development Team ID" )
set( APPLICATION_VIRTUALFILE_SUFFIX "lracloud" CACHE STRING "Virtual file suffix (not including the .)")
set( APPLICATION_OCSP_STAPLING_ENABLED OFF )
set( APPLICATION_FORBID_BAD_SSL OFF )

set( LINUX_PACKAGE_SHORTNAME "lracloud" )
set( LINUX_APPLICATION_ID "${APPLICATION_REV_DOMAIN}.${LINUX_PACKAGE_SHORTNAME}")

set( THEME_CLASS            "NextcloudTheme" )
set( WIN_SETUP_BITMAP_PATH  "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

set( MAC_INSTALLER_BACKGROUND_FILE "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png" CACHE STRING "The MacOSX installer background image")

## Updater options
option( BUILD_UPDATER "Build updater" ON )
option( WITH_PROVIDERS "Build with providers list" ON )
option( ENFORCE_VIRTUAL_FILES_SYNC_FOLDER "Enforce use of virtual files sync folder when available" OFF )
option( DISABLE_VIRTUAL_FILES_SYNC_FOLDER "Disable use of virtual files sync folder even when available" OFF )
option( ENFORCE_SINGLE_ACCOUNT "Enforce use of a single account in desktop client" OFF )
option( DO_NOT_USE_PROXY "Do not use system wide proxy, instead always do a direct connection to server" OFF )
option( WIN_DISABLE_USERNAME_PREFILL "Do not prefill the Windows user name when creating a new account" OFF )

## Theming options
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR "#1a1a2e" CACHE STRING "Hex color of the wizard header background")
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" CACHE STRING "Hex color of the text in the wizard header")
option( APPLICATION_WIZARD_USE_CUSTOM_LOGO "Use the logo from ':/client/theme/colored/wizard_logo.(png|svg)' else the default application icon is used" ON )

if(WIN32)
    set( WIN_SHELLEXT_CONTEXT_MENU_GUID      "{BC6988AB-ACE2-4B81-84DC-DC34F9B24401}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_ERROR     "{E0342B74-7593-4C70-9D61-22F294AAFE05}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK        "{E1094E94-BE93-4EA2-9639-8475C68F3886}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK_SHARED "{E243AD85-F71B-496B-B17E-B8091CBE93D2}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_SYNC      "{E3D6DB20-1D83-4829-B5C9-941B31C0C35A}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_WARNING   "{E4977F33-F93A-4A0A-9D3C-83DEA0EE8483}" )
    set( WIN_MSI_UPGRADE_CODE                "FD2FCCA9-BB8F-4485-8F70-A0621B84A7F4" )
    option( BUILD_WIN_MSI "Build MSI scripts and helper DLL" OFF )
    option( BUILD_WIN_TOOLS "Build Win32 migration tools" OFF )
endif()

if (APPLE AND CMAKE_OSX_DEPLOYMENT_TARGET VERSION_GREATER_EQUAL 11.0)
    option( BUILD_FILE_PROVIDER_MODULE "Build the macOS virtual files File Provider module" OFF )
endif()
