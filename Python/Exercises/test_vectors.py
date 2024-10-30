"""Training with threads."""

import time
from threading import Thread


class Counter(Thread):
    """Thread counting with 1s delay."""

    def __init__(self, name: str, stop_value: int = 10, sleep_delay_s: float = 1.0):
        super().__init__(name=name)
        self._stop_value = stop_value
        self._sleep_delay_s = sleep_delay_s

    def start(self) -> None:
        super().start()
        print(f"Start counting: delay = {self._sleep_delay_s}s")

    def run(self) -> None:
        for i in range(self._stop_value):
            print(f"Counter {self.name}: {i}")
            time.sleep(self._sleep_delay_s)


def main():
    counter1_thread = Counter(
        "Counter 1", stop_value=10, sleep_delay_s=1
    )  # count from 0 to 10 with 1s delay
    counter2_thread = Counter("Counter 2", 50, 3)  # count from 0 to 50 with 3s delay
    counter3_thread = Counter(
        "Counter 3", 20
    )  # count from 0 to 20 with 1s delay (1s is the default)
    print(f"{counter1_thread.is_alive() = }")

    # Start both threads: both code will run in parallel
    counter1_thread.start()
    counter2_thread.start()
    counter3_thread.start()
    print(f"{counter1_thread.is_alive() = }")

    print("Main thread: sleeping")
    time.sleep(12)

    # Make sure each thread has finished, or wait until they are finished
    print("Main thread: waiting for all threads")
    counter1_thread.join()
    counter2_thread.join()
    counter3_thread.join()
    print(f"{counter1_thread.is_alive() = }")


if __name__ == "__main__":
    main()