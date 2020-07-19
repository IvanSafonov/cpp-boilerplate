#include "feature.h"

#include "utils/injector.h"

namespace Module {

FeatureMock::FeatureMock() { inject(this); }

FeatureMock::~FeatureMock() { inject(nullptr); }

} // namespace Module
