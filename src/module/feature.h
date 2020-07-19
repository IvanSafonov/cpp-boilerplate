#pragma once

#include "utils/injector.h"

#include <string>

namespace Module {

class Feature : public Injector<Feature> {
public:
  virtual ~Feature() = default;

  [[nodiscard]] virtual std::string name() const;

  virtual int run(int param1, int param2);
};

} // namespace Module
