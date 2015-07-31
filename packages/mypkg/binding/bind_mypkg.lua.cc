//BIND_HEADER_H
#include "mypkg.h"
//BIND_END

//BIND_HEADER_C
#include "april-ann.h"
using namespace Example;
//BIND_HEADER_C

//BIND_FUNCTION mypkg.get
{
  AprilUtils::SharedPtr<Basics::MatrixFloat> m3 = Example::get();
  AprilUtils::LuaTable::pushInto(L, m3.get());
  LUABIND_INCREASE_NUM_RETURNS(1);
}
//BIND_END
