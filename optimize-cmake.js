const fs = require('fs');
// const path = process.argv[2];
const path = "./External/spirv-tools/CMakeLists.txt"
let content = fs.readFileSync(path, { encoding: 'utf8' });

if(content.indexOf("if(USE_CXX_EXCEPTIONS)\n target_compile_options(${TARGET} PRIVATE /EHs)\n endif()") < 0)
{
content = content
    .replace("target_compile_options(${TARGET} PRIVATE /EHs)",
        'if(USE_CXX_EXCEPTIONS)\n target_compile_options(${TARGET} PRIVATE /EHs)\n endif()');
fs.writeFileSync(path, content);
}