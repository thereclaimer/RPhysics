::----------------------------------------------------------------
:: START
::----------------------------------------------------------------

@echo off

pushd ..

::----------------------------------------------------------------
:: VARIABLES
::----------------------------------------------------------------

@set path_bin_r_physics=    bin\debug-x64
@set path_include_r_common= modules\r-common\include

if not exist %path_bin_r_physics% (
    mkdir %path_bin_r_physics%
)


::----------------------------------------------------------------
:: ARGUMENTS
::----------------------------------------------------------------

@set cl_flags=        /c  ^
                      /Zi

@set cl_output=       /Fo:%path_bin_r_physics%\RPhysics.obj ^
                      /Fd:%path_bin_r_physics%\RPhysics.pdb


@set cl_includes=     /I src                ^
                      /I include            ^
                      /I internal           ^
                      /I %path_include_r_common%

@set cl_source=       src\r-physics.cpp

@set cl_link=

::----------------------------------------------------------------
:: COMPILE
::----------------------------------------------------------------

call cl.exe       ^
    %cl_flags%    ^
    %cl_output%   ^
    %cl_includes% ^
    %cl_source%   ^
    %cl_link%

::----------------------------------------------------------------
:: LINK
::----------------------------------------------------------------

call lib.exe /out:bin\debug-x64\RPhysics.lib bin\debug-x64\RPhysics.obj

::----------------------------------------------------------------
:: END
::----------------------------------------------------------------

popd