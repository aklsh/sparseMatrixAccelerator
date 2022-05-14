<project xmlns="com.autoesl.autopilot.project" name="SPMV_CSR" top="accelerate">
    <includePaths/>
    <libraryPaths/>
    <Simulation argv="">
        <SimFlow name="csim" setup="true" ldflags="-B&quot;/usr/lib/x86_64-linux-gnu/&quot;" clean="true" csimMode="2" lastCsimMode="2"/>
    </Simulation>
    <files xmlns="">
        <file name="../../SPMV_CSR_src/main.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="SPMV_CSR_src/accelerator/reducer.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="SPMV_CSR_src/accelerator/reducer.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="SPMV_CSR_src/encoded_data.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="SPMV_CSR_src/accelerator/constants.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="SPMV_CSR_src/accelerator/accelerator.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="SPMV_CSR_src/accelerator/accelerator.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

