#include "feature.h"

namespace Module {

std::string Feature::name() const { return "name"; }

int Feature::run(int param1, int param2) {
  if (param1 > param2)
    return param1 * param2;

  return param1 + param2;
}

} // namespace Module
