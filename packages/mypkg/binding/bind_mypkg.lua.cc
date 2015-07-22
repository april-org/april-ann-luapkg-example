//BIND_HEADER_H
#include "example.h"
//BIND_END

//BIND_HEADER_C
#include "april-ann.h"
using namespace Example;
//BIND_HEADER_C

//BIND_STATIC_CONSTRUCTOR utils_static_constructor
{
  luaL_requiref(L, "aprilann", luaopen_aprilann, 1);
}
//BIND_END

//BIND_FUNCTION mypkg.get
{
  AprilUtils::SharedPtr<Basics::MatrixFloat> m3 = Example::get();
  AprilUtils::LuaTable::pushInto(L, m3.get());
}
//BIND_END
