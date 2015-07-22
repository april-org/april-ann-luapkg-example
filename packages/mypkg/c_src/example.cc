#include "april-ann.h" // includes all APRIL-ANN headers

using namespace AprilMath::MatrixExt::BLAS;
using namespace AprilMath::MatrixExt::Initializers;

using AprilUtils::LuaTable;
using AprilUtils::SharedPtr;
using Basics::MatrixFloat;

namespace Example {

  SharedPtr<MatrixFloat> get() {
    SharedPtr<MatrixFloat> m1 = new MatrixFloat(2, 10, 20);
    SharedPtr<MatrixFloat> m2 = new MatrixFloat(2, 20, 10);
    matFill(m1.get(), 20.0f);
    matFill(m2.get(), 10.0f);
    SharedPtr<MatrixFloat> m3 = new MatrixFloat(2, 10, 10);
    matGemm(m3.get(), CblasNoTrans, CblasNoTrans,
            1.0f, m1.get(), m2.get(), 0.0f);
    return m3;
  }

} // namespace Example
