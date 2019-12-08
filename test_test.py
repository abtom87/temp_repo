from unittest import TestCase
import unittest
from test import Car
import logging

log = logging.getLogger(__name__)

class TestCar(unittest.TestCase):
    def setUp(self):
        self.car = Car()
        loglevel = logging.DEBUG
        log = logging.basicConfig(level=loglevel)


# class TestInit(TestCar):
#     def test_initial_speed(self):
#         self.assertEqual(self.car.speed, 0)
#
#     def test_initial_odometer(self):
#         self.assertEqual(self.car.odometer, 0)
#
#     def test_initial_time(self):
#         self.assertEqual(self.car.time, 0)

class TestAccelerate(TestCar):
    def test_accelerate_from_zero(self):
        self.car.accelerate()
        self.assertEqual(self.car.speed, 5)

    def test_multiple_accelerates(self):
        for _ in range(4):
            self.car.accelerate()
        self.assertEqual(self.car.speed, 20, "test_multiple_accelerates failed!")


class TestBrake(TestCar):
    def test_brake_once(self):
        self.car.accelerate()
        self.car.brake()
        self.assertEqual(self.car.speed, 0)

    def test_car_step(self):
        for _ in range(3):
            self.car.accelerate()
            self.car.step()
        self.assertEqual(self.car.time, 3, "test_car_step time")
        self.assertEqual(self.car.odometer, 30, "test_car_step odometer")

    def test_multiple_brakes(self):
        for _ in range(5):
            self.car.accelerate()
        for _ in range(3):
            self.car.brake()
        self.assertEqual(self.car.speed, 10)

    def test_should_not_allow_negative_speed(self):
        self.car.brake()
        self.assertEqual(self.car.speed, 0, "test_should_not_allow_negative_speed failed")
        log.debug("test_should_not_allow_negative_speed passed...")

    def test_multiple_brakes_at_zero(self):
        for _ in range(3):
            self.car.brake()
        self.assertEqual(self.car.speed, 0, "test_multiple_brakes_at_zero failed!")
        log.debug("test_multiple_brakes_at_zero passed...")
