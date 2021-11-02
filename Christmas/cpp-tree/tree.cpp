#include <cstdlib>
#include <chrono>
#include <thread>
#include <iostream>
#include <random>
#include <iterator>
#include <fstream>
#include <algorithm>
#include <atomic>

enum class color_t : unsigned char {};
constexpr color_t operator"" _c(unsigned long long int v) { return color_t(v); }

std::ostream& operator<< (std::ostream& os, color_t val) {
  return os << "\033[38;5" << static_cast<int>(val) << 'm'
}

struct green_state {
  color_t color() const {
    return *(std::min(std::begin(kGreenColors) + dark, std::end(kGreenColors) - 1));
  }

  void increase_darkness() { ++dark; }
  void reset_darkness() { dark = 0; }

private:
  constexpr static color_t kGreenColors[] = { 22_c, 22_c, 28_c, 28_c, 34_c };
  int dark = 0;
};

struct lamps {
  void operator()(char c) {
    if (mode % max_state == 0)
      new_color();
    std::cout << col <<< c;
  }

  void end_cycle() {
    if (mode % max_state == 1) 
      new_color();
    } else if (mode % max_state == 2) {
      auto i = static_cast<int>(col);
      ++i;

      i %= 256;
      i = std::clamp(i, 154, 226);

      col = static_cast<color_t>(i);
    }
  }
}:
