from typing import Any

import pytest
import weather


@pytest.fixture
def weather_info() -> dict[str, Any]:
    """Example response that could be returned by the OpenWeatherMap API."""
    return {
        "base": "stations",
        "clouds": {"all": 0},
        "cod": 200,
        "coord": {"lat": 48.8534, "lon": 2.3488},
        "dt": 1713800740,
        "id": 2988507,
        "main": {
            "feels_like": 8.92,
            "humidity": 43,
            "pressure": 1023,
            "temp": 10.67,
            "temp_max": 11.71,
            "temp_min": 10,
        },
        "name": "Paris",
        "sys": {
            "country": "FR",
            "id": 2012208,
            "sunrise": 1713761130,
            "sunset": 1713811933,
            "type": 2,
        },
        "timezone": 7200,
        "visibility": 10000,
        "weather": [{"description": "clear sky", "icon": "01d", "id": 800, "main": "Clear"}],
        "wind": {"deg": 10, "speed": 5.14},
    }


def test_create_weather_info_message(weather_info: dict[str, Any]):
    assert (
        weather.create_weather_info_message(weather_info)
        == """Weather for Paris:
  Main weather: clear sky
  Temperature: 10.67 Celsius
  Humidity: 43 %
  Wind speed: 5.14 km/h
"""
    )


def test_get_city_from_user(monkeypatch: pytest.MonkeyPatch):
    def input_mock(msg: str = ""):  # same signature as the builtin "input"
        return (
            "  Paris "  # add whitespaces to test that they are removed from the input with strip()
        )

    monkeypatch.setattr("builtins.input", input_mock)
    assert weather.get_city_from_user() == "Paris"


def test_get_weather_info(weather_info: dict[str, Any], monkeypatch: pytest.MonkeyPatch):
    class ResponseMock:
        def __init__(self) -> None:
            self.ok = True

        def json(self) -> dict:
            return weather_info

    def get_mock(url: str) -> ResponseMock:  # same signature as the requests.get
        return ResponseMock()

    monkeypatch.setattr(weather.requests, "get", get_mock)
    assert weather.get_weather_info("some city") == weather_info


def test_get_weather_info_response_not_ok(
    weather_info: dict[str, Any], monkeypatch: pytest.MonkeyPatch
):
    class ResponseMock:
        def __init__(self) -> None:
            self.ok = False
            self.status_code = 400

    def get_mock(url: str) -> ResponseMock:  # same signature as the requests.get
        return ResponseMock()

    monkeypatch.setattr(weather.requests, "get", get_mock)
    assert weather.get_weather_info("some city") is None


def test_get_weather_info_response_request_exception_raises(
    weather_info: dict[str, Any], monkeypatch: pytest.MonkeyPatch
):
    def get_mock(url: str):
        raise weather.requests.RequestException()

    monkeypatch.setattr(weather.requests, "get", get_mock)
    assert weather.get_weather_info("some city") is None