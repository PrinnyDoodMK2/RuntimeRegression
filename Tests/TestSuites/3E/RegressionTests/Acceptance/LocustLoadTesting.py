# A locust file is just a normal Python module, it can import code from other files or packages.
# To start Locust, use the following command:
# locust -f /Users/runtime/PycharmProjects/RuntimeRegression/Tests/TestSuites/3E/RegressionTests/Acceptance
# /LocustLoadTesting.py
# Use the following url to access the localhost: http://localhost:8089
import time
from locust import HttpUser, task, between


# Here we define a class for the users that we will be simulating.
# It inherits from HttpUser which gives each user a client attribute, which is an instance of HttpSession,
# that can be used to make HTTP requests to the target system that we want to load test.
# When a test starts, locust will create an instance of this class for every user that it simulates,
# and each of these users will start running within their own green gevent thread.
# For a file to be a valid locust file it must contain at least one class inheriting from User.
class QuickstartUser(HttpUser):
    # Our class defines a wait_time that will make the simulated users wait between
    # 1 and 5 seconds after each task (see below) is executed. For more info, search for "wait_time attribute".
    wait_time = between(1, 5)

    # Methods decorated with @task are the core of your locust file. For every running user,
    # Locust creates a greenlet (micro-thread), that will call those methods.
    @task
    def hello_world(self):
        self.client.get("/hello")
        self.client.get("/world")

    @task(3)
    def view_items(self):
        for item_id in range(10):
            self.client.get(f"/item?id={item_id}", name="/item")
            time.sleep(1)

    # We’ve declared two tasks by decorating two methods with @task, one of which has been given a higher weight (3).
    # When our QuickstartUser runs it’ll pick one of the declared tasks -
    # in this case either hello_world or view_items - and execute it.
    # Tasks are picked at random, but you can give them different weighting.
    # The above configuration will make Locust three times more likely to pick view_items than hello_world.
    # When a task has finished executing, the User will then sleep during its wait time (in this case
    # between 1 and 5 seconds). After its wait time it’ll pick a new task and keep repeating that.
    #
    # Note that only methods decorated with @task will be picked, so you can define your own
    # internal helper methods any way you like.

    def on_start(self):
        # The self.client attribute makes it possible to make HTTP calls that will be logged by Locust.
        # For information on how to make other kinds of requests, validate the response, etc.,
        # see Using the HTTP Client.
        self.client.post("/login", json={"username": "runtimerev", "password": "x8Wc!&1Z^#"})
