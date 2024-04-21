#include <unistd.h>
#include <signal.h>

static void signaled() {
}

int main()
{
        signal(SIGTERM, signaled);
        signal(SIGINT, signaled);
        pause();
        return 0;
}
