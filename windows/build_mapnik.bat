@echo off

set ROOTDIR=c:\dev2
@rem note - MAPNIK_DEPS_DIR and MAPNIK_SOURCE
@rem are needed by bjam files
@rem so do not rename or remove them
set MAPNIK_DEPS_DIR=%ROOTDIR%
set MAPNIK_SOURCE=%ROOTDIR%\mapnik

set BOOST_VERSION=49
set BOOST_PREFIX=boost-%BOOST_VERSION%-vc100
set BOOST_INCLUDES=%ROOTDIR%\%BOOST_PREFIX%\include\boost-1_%BOOST_VERSION%
set BOOST_LIBS=%ROOTDIR%\%BOOST_PREFIX%\lib
set PREFIX=c:\mapnik-2.0
set PATH=%ROOTDIR%\boost_1_%BOOST_VERSION%_0;%PATH%

bjam toolset=msvc -j2 --prefix=%PREFIX% -sBOOST_INCLUDES=%BOOST_INCLUDES% -sBOOST_LIBS=%BOOST_LIBS% -sMAPNIK_DEPS_DIR=%MAPNIK_DEPS_DIR% -sMAPNIK_SOURCE=%MAPNIK_SOURCE%

@rem copy all libs of dependencies
@rem expat, needed by ogr plugin
copy "C:\Program Files (x86)\Expat 2.1.0\Bin\libexpat.dll" %PREFIX%\lib\
@rem the rest, needed by libmapnik
copy %ROOTDIR%\cairo\src\release\cairo.dll %PREFIX%\lib\
copy %ROOTDIR%\cairomm\MSVC_Net2010\cairomm\Win32\Release\cairomm-vc100-1_0.dll %PREFIX%\lib\
copy %ROOTDIR%\icu\bin\icuuc48.dll %PREFIX%\lib\
copy %ROOTDIR%\icu\bin\icudt48.dll %PREFIX%\lib\
copy %ROOTDIR%\libxml2\win32\bin.msvc\libxml2.dll %PREFIX%\lib\
copy %ROOTDIR%\proj\src\proj.dll %PREFIX%\lib\
copy "%ROOTDIR%\libsigc++\MSVC_Net2010\Win32\Release\sigc-vc100-2_0.dll" %PREFIX%\lib\