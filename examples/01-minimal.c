#include <rexo.h>

RX_TEST_CASE(foo, bar)
{
    RX_INT_REQUIRE_EQUAL(2 * 3 * 7, 42);
}

int main(int argc, const char **argv)
{
    return rx_main(0, NULL, argc, argv) == RX_SUCCESS ? 0 : 1;
}
