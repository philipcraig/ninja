rem This must be run inside a visual studio command prompt
rem or after vcvars.bat has been executed

echo Building ninja manually...

cl /EHsc /GF /GL /MT /Ox /D WIN32 /D NOMINMAX /D NDEBUG /D _CONSOLE ^
src/build.cc src/build_log.cc src/clean.cc ^
src/eval_env.cc src/graph.cc src/graphviz.cc src/ninja.cc src/ninja_jumble.cc ^
src/parsers.cc src/stat_cache.cc src/subprocess-win32.cc src/util.cc src/getopt.c ^
/link /out:ninja.exe /LTCG /OPT:REF /OPT:ICF /SUBSYSTEM:CONSOLE /NXCOMPAT

rem Exit here as configure.py not yet customised for Windows platform
exit /b 0

rename ninja-bootstrap.exe ninja.exe

rem This is what we'd do if configure was customised for Windows
rem This must be run on a machine with Python installed and .py files pointed at it.
configure.py --platform=windows
ninja-bootstrap ninja
del ninja-bootstrap.exe

