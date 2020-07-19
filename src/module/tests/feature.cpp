#include "module/feature.h"

#include "gtest/gtest.h"

using namespace ::testing;

TEST(FeatureTest, run) {
  Module::Feature feature;
  EXPECT_EQ(feature.run(2, 10), 12);
  EXPECT_EQ(feature.run(20, 10), 200);
}
