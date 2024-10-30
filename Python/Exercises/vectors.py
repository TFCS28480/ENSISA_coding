"""Manipulation of 2D-vectors.

Note :
``from __future__ import annotations`` est nécessaire si l'on veut pouvoir utiliser une classe
en tant qu'annotation de type dans cette même classe ! Comme dans l'exemple suivant :
class Point:
    @classmethod
    def origin(cls) -> Point:  # "Error: Point not defined" serait levé sans l'utilisation de ``from __future__ import annotations``

"""

from __future__ import annotations

import math


class Point:
    """Two dimension point."""

    def __init__(self, x: float, y: float) -> None:
        self.x = x
        self.y = y

    @classmethod
    def origin(cls) -> Point:
        return Point(0, 0)

    def __repr__(self) -> str:
        return f"Point({self.x}, {self.y})"

    def __str__(self) -> str:
        return f"Point({self.x}, {self.y})"


class Vector:
    """Two dimension vector."""

    def __init__(self, x_coordinate: float, y_coordinate: float) -> None:
        self.x = x_coordinate
        self.y = y_coordinate

    @classmethod
    def from_points(cls, tail: Point, head: Point) -> Vector:
        """Create a vector from two points."""
        return Vector(head.x - tail.x, head.y - head.y)

    @property
    def magnitude(self) -> float:
        """Return the vector's magnitude."""
        return math.sqrt(self.x**2 + self.y**2)

    def dot_prod(self, other: Vector) -> float:
        """Return the vector's with another vector."""
        return self.x * other.x + self.y * other.y

    def __repr__(self) -> str:
        return f"Vector({self.x}, {self.y})"

    def __str__(self) -> str:
        return f"Vector({self.x}, {self.y})"

    def __add__(self, other: Vector) -> Vector:
        return Vector(self.x + other.x, self.y + other.y)

    def __sub__(self, other: Vector) -> Vector:
        return Vector(self.x - other.x, self.y - other.y)

    def __neg__(self) -> Vector:
        return Vector(-self.x, -self.y)

    def __mul__(self, scalar: float) -> Vector:
        return Vector(scalar * self.x, scalar * self.y)

    def __rmul__(self, scalar: float) -> Vector:
        return self * scalar


def main():
    origin = Point.origin()
    point_A = Point(-2, -1)
    point_B = Point(3, 7)

    print(f"Point O: x={origin.x} y={origin.y}")
    print(f"Point A: x={point_A.x} y={point_A.y}")
    print(f"Point B: x={point_B.x} y={point_B.y}")


def main_2():
    v = Vector(1, 1)
    v2 = Vector(3, -2)

    print(f"{v.magnitude = }")
    print(f"{v.dot_prod(v2) = }")
    print(f"{v2.dot_prod(v) = }")


def main_3():
    v = Vector(1, 1)
    v2 = Vector(3, -2)

    print(f"{v + v2 = }")
    print(f"{-v = }")
    print(f"{- (-v) = }")
    print(f"{v - v2 = }")
    print(f"{v * 2 = }")
    print(f"{v2 * (-10) = }")  # will use __mul__
    print(f"{100 * v2 = }")  # will use __rmul__


def main_4():
    origin = Point.origin()
    point_A = Point(-2, -1)
    point_B = Point(3, 7)

    vector_AB = Vector.from_points(point_A, point_B)
    vector_OA = Vector.from_points(origin, point_A)
    vector_AB = Vector.from_points(point_A, point_B)

    print(f"Vector OA: dx={vector_OA.x} dy={vector_OA.y}")
    print(f"Vector AB: dx={vector_AB.x} dy={vector_AB.y}")


if __name__ == "__main__":
    main()
    main_2()
    main_3()
    main_4()