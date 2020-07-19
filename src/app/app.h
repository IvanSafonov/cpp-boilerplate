#pragma once

#include <memory>

namespace Module {
class Feature;
}

namespace App {

class App {

public:
  App();
  ~App() = default;

  int run();

private:
  std::shared_ptr<Module::Feature> m_feature;
};

} // namespace App