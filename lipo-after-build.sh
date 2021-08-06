if [ $# -eq 0 ]; then
    echo "error! require inputs"
else
    PLAT=$1
fi

BUILD_DIR_X86_64=$2
BUILD_DIR_ARM64=$3
mkdir output_$PLAT
outputDir=output_$PLAT
glslangList=(libGenericCodeGen libglslang-default-resource-limits libglslang libMachineIndependent libOGLCompiler libOSDependent libSPIRV-Tools libSPIRV-Tools-opt libSPIRV libSPVRemapper)
for gl in ${glslangList@}
do 
    echo "start lipo"
    lipo -create $BUILD_DIR_X86_64/output/$gl.a $BUILD_DIR_ARM64/output/$gl.a -output $outputDir/$gl.a
done
