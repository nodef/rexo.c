#include <rexo.h>

struct foo_data {
    const char *value;
};

RX_SET_UP(foo_set_up)
{
    struct foo_data *data;

    data = (struct foo_data *)RX_DATA;
    data->value = "world!";
    return RX_SUCCESS;
}

RX_FIXTURE(foo_fixture, struct foo_data, .set_up = foo_set_up);

RX_TEST_CASE(foo, bar, .fixture = foo_fixture)
{
    struct foo_data *data;

    data = (struct foo_data *)RX_DATA;
    RX_STR_REQUIRE_EQUAL("Hello", data->value);
}

int
main(int argc, const char **argv)
{
    return rx_main(0, NULL, argc, argv) == RX_SUCCESS ? 0 : 1;
}
