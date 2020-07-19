#pragma once

#include <memory>

/**
 * @brief Makes object injectable
 * If you need to inject mock object in unit test you can use this
 * template with Injector<MockableObject>::create()
 * Or you can inherit your object from Injector<MockableObject>
 * and create objects with MockableObject::create()
 * In test you can set mock with inject method
 */
template <typename T> class Injector {
public:
  /**
   * @brief Create a new object
   */
  template <typename... Args>
  static std::shared_ptr<T> create(Args &&... args) {
    if (injection)
      return std::shared_ptr<T>(injection, [](T * /*unused*/) {});

    return std::make_shared<T>(std::forward<Args>(args)...);
  }

  /**
   * @brief Inject mock object
   */
  static void inject(T *value) { injection = value; }

private:
  static T *injection;
};

template <typename T> T *Injector<T>::injection{};
