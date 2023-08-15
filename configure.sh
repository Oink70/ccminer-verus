# To change the cuda arch, edit Makefile.am and run ./build.sh

# extracflags="-D_REENTRANT -falign-functions=16 -falign-jumps=16 -falign-labels=16"
extracflags="-O3 -ffinite-loops -ffast-math -mfix-cortex-a53-835769 -D_REENTRANT -falign-functions=16 -fomit-frame-pointer -fpic -pthread -flto -fuse-ld=lld -fno-stack-protector"

# ./configure CXXFLAGS="-O3 $extracflags"
./configure CXXFLAGS="-Rpass-missed=loop-vectorize -Rpass-analysis=loop-vectorize -Wl,-hugetlbfs-align -funroll-loops -finline-functions $extracflags -march=armv8-a+crypto -mtune=cortex-a53" CFLAGS="-finline-functions -Wl,-hugetlbfs-align -march=armv8-a+crypto -mtune=cortex-a53 -Rpass-missed=loop-vectorize -Rpass-analysis=loop-vectorize $extracflags -mllvm -enable-loop-distribute"   CXX=clang++ CC=clang LDFLAGS="-v -flto -Wl,-hugetlbfs-align"
