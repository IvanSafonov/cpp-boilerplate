#include "app/app.h"

#include "module/mocks/feature.h"

#include "gtest/gtest.h"

using namespace ::testing;

TEST(AppTest, run) {
  Module::FeatureMock feature;
  EXPECT_CALL(feature, run(_, _)).WillOnce(Return(100));

  App::App app;

  EXPECT_EQ(app.run(), 100);
}
