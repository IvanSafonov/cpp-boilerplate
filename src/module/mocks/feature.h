#include "module/feature.h"

#include <gmock/gmock.h>

namespace Module {

class FeatureMock : public Feature {
public:
  FeatureMock();
  ~FeatureMock() override;

  MOCK_METHOD(std::string, name, (), (const, override));
  MOCK_METHOD(int, run, (int param1, int param2), (override));
};

} // namespace Module